import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rama_otaqu/core/constants/api_constant.dart';
import 'package:rama_otaqu/core/helpers/app_exception_helper.dart';
import 'package:rama_otaqu/core/services/network/api_network_service.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/search_result/models/list_avail_response_model.dart';

@injectable
class SearchResultRepository {
  Future<Either<AppExceptionHelper, ListAvailResponseModel>> fetchSearchResult({
    required DestinationEntityModel data,
    int page = 1,
  }) async {
    final result = await ApiNetworkService.request((dio) async {
      return await dio.post(
        ApiConstant.availEndpoint,
        data: {
          "type_source": "location",
          "type_id": 3,
          "destination_id": data.destinationId,
          "min_price": 0,
          "max_price": 10000000000,
          "page": page,
          "order_by": "lowest",
          "reference": "search",
        },
      );
    });

    return result.fold((l) => Left(l), (r) {
      try {
        ListAvailResponseModel data = ListAvailResponseModel.fromJson(r.data);
        return Right(data);
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
}
