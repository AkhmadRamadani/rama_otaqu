import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/constants/api_constant.dart';
import 'package:rama_otaqu/core/helpers/app_exception_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/destination_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';
import 'package:rama_otaqu/core/services/databases/mappers/destination_mapper.dart';
import 'package:rama_otaqu/core/services/network/api_network_service.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/home/models/destination_response_model.dart';

@injectable
class DestinationRepository {
  DestinationDbHelper localDb = getIt.get<DestinationDbHelper>();
  DestinationMapper mapper = getIt.get<DestinationMapper>();

  Future<Either<AppExceptionHelper, List<DestinationEntityModel>>> filterData(
    String query,
  ) async {
    try {
      final data = await localDb.getFilteredDestinations(nameFilter: query);

      return Right(mapper.localToEntity(data));
    } catch (e) {
      return Left(UnexpectedException());
    }
  }

  Future<Either<AppExceptionHelper, List<DestinationEntityModel>>>
  getData() async {
    if (await localDb.hasLocalData()) {
      var data = await _getLocalDestinations();

      return data.fold((l) => Left(l), (r) => Right(mapper.localToEntity(r)));
    } else {
      final result = await _fetchDestinations();

      return result.fold(
        (l) => Left(l),
        (r) => Right(mapper.networkToEntity(r)),
      );
    }
  }

  Future<Either<AppExceptionHelper, List<DestinationNetworkModel>>>
  _fetchDestinations() async {
    final result = await ApiNetworkService.request((dio) async {
      return await dio.get(ApiConstant.destinationEndpoint);
    });

    return result.fold(
      (l) {
        log(l.toString());
        return Left(l);
      },
      (r) {
        try {
          BaseDestinationResponseModel data =
              BaseDestinationResponseModel.fromJson(r.data ?? '');

          var destinations = mapper.networkToLocal(data.data ?? []);
          localDb.saveDestinations(destinations);

          return Right(data.data ?? []);
        } catch (e) {
          if (e is AppExceptionHelper) {
            return Left(e);
          } else if (e is FormatException) {
            return Left(DataParsingException(e.message));
          } else {
            log(e.toString());
            return Left(UnexpectedException());
          }
        }
      },
    );
  }

  Future<Either<AppExceptionHelper, List<DestinationLocalModel>>>
  _getLocalDestinations() async {
    try {
      final destinations = localDb.getAllDestinations();
      return Right(destinations);
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
