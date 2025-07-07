import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/constants/api_constant.dart';
import 'package:rama_otaqu/core/helpers/app_exception_helper.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';
import 'package:rama_otaqu/core/services/network/api_network_service.dart';
import 'package:rama_otaqu/core/services/network/models/auth_response_model.dart';

class AuthRepository {
  static Future<Either<AppExceptionHelper, String>> refreshToken() async {
    final result = await ApiNetworkService.request((dio) async {
      final username = dotenv.env['USERNAME_LOGIN'];
      final password = dotenv.env['PASSWORD_LOGIN'];
      return await dio.post(
        ApiConstant.loginEndpoint,
        data: {"username": username, "password": password},
      );
    });

    return result.fold((l) => Left(l), (r) {
      try {
        AuthResponseModel data = AuthResponseModel.fromJson(r.data);
        return Right(data.data?.accessToken ?? '');
      } catch (e) {
        if (e is AppExceptionHelper) {
          return Left(e);
        } else if (e is FormatException) {
          return Left(DataParsingException(e.message));
        } else {
          return Left(UnexpectedException());
        }
      }
    });
  }

  static Future<Either<AppExceptionHelper, String?>> getToken() async {
    try {
      final token = Hive.box<String>(
        HiveConstant.stringBox,
      ).get(HiveConstant.tokenKey);
      return Right(token);
    } catch (e) {
      if (e is AppExceptionHelper) {
        return Left(e);
      } else if (e is FormatException) {
        return Left(DataParsingException(e.message));
      } else {
        return Left(UnexpectedException());
      }
    }
  }
}
