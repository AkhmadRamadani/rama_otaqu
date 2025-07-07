import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/helpers/app_exception_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/recent_search_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/mappers/destination_mapper.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';

@injectable
class RecentSearchRepository {
  RecentSearchDbHelper localDb = getIt.get<RecentSearchDbHelper>();
  DestinationMapper mapper = getIt.get<DestinationMapper>();

  Future<Either<AppExceptionHelper, List<DestinationEntityModel>>>
  getData() async {
    final data = localDb.getAllRecentSearches();
    return Right(mapper.localToEntity(data));
  }
}
