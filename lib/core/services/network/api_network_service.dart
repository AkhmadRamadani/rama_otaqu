import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/constants/api_constant.dart';
import 'package:rama_otaqu/core/helpers/app_exception_helper.dart';
import 'package:rama_otaqu/core/helpers/network_error_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/token_db_helper.dart';
import 'package:rama_otaqu/core/services/network/repositories/auth_repository.dart';

class ApiNetworkService {
  ApiNetworkService._();

  static final ApiNetworkService _instance = ApiNetworkService._();
  static bool _isRefreshing = false;
  static Dio? _dio;
  TokenDbHelper get tokenDbHelper => getIt<TokenDbHelper>();

  Dio _getDio() {
    if (_dio != null) return _dio!;

    _dio = Dio();
    _dio!.options.baseUrl = ApiConstant.baseUrl;
    _dio!.options.connectTimeout = const Duration(seconds: 20);
    _dio!.options.receiveTimeout = const Duration(seconds: 20);
    _dio!.options.headers['Content-Type'] = 'application/json';
    _dio!.options.headers['Accept'] = 'application/json';

    _dio!.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = tokenDbHelper.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 && !_isRefreshing) {
            _isRefreshing = true;
            try {
              final newToken = await AuthRepository.refreshToken();

              if (newToken.isLeft()) {
                return handler.reject(e);
              }

              final tokenValue = newToken.getOrElse(() => '');
              await tokenDbHelper.putToken(tokenValue);

              e.requestOptions.headers['Authorization'] = 'Bearer $newToken';

              final response = await _dio!.fetch(e.requestOptions);
              return handler.resolve(response);
            } catch (refreshError) {
              return handler.reject(e);
            } finally {
              _isRefreshing = false;
            }
          }
          return handler.next(e);
        },
      ),
    );

    _dio!.interceptors.add(
      LogInterceptor(
        error: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        request: true,
        responseHeader: true,
      ),
    );

    return _dio!;
  }

  static Dio call() {
    return _instance._getDio();
  }

  static Future<Either<AppExceptionHelper, Response>> request(
    Future<Response> Function(Dio dio) requestFunction,
  ) async {
    try {
      final dio = call();
      final response = await requestFunction(dio);
      return Right(response);
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 401) {
        return Left(UnauthorizedException());
      }
      final errorMessage = NetworkErrorHelper.fromDioError(dioError);
      final appException = NetworkException(errorMessage);
      return Left(appException);
    } on FormatException catch (formatError) {
      return Left(DataParsingException(formatError.message));
    } catch (e) {
      return Left(UnexpectedException());
    }
  }
}
