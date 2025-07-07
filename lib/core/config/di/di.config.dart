// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../modules/home/repositories/destination_repository.dart'
    as _i571;
import '../../../modules/home/repositories/recent_search_repository.dart'
    as _i391;
import '../../../modules/search_result/repositories/search_result_repository.dart'
    as _i755;
import '../../services/databases/helpers/bool_db_helper.dart' as _i435;
import '../../services/databases/helpers/destination_db_helper.dart' as _i354;
import '../../services/databases/helpers/recent_search_db_helper.dart' as _i268;
import '../../services/databases/helpers/token_db_helper.dart' as _i446;
import '../../services/databases/local_db.dart' as _i130;
import '../../services/databases/mappers/destination_mapper.dart' as _i906;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i571.DestinationRepository>(
      () => _i571.DestinationRepository(),
    );
    gh.factory<_i391.RecentSearchRepository>(
      () => _i391.RecentSearchRepository(),
    );
    gh.factory<_i755.SearchResultRepository>(
      () => _i755.SearchResultRepository(),
    );
    gh.singleton<_i446.TokenDbHelper>(() => registerModule.tokenDbHelper);
    gh.singleton<_i354.DestinationDbHelper>(
      () => registerModule.destinationDbHelper,
    );
    gh.singleton<_i268.RecentSearchDbHelper>(
      () => registerModule.recentSearchDbHelper,
    );
    gh.singleton<_i906.DestinationMapper>(
      () => registerModule.destinationMapper,
    );
    gh.singleton<_i435.BoolDbHelper>(() => registerModule.boolDbHelper);
    gh.singleton<_i130.LocalDb>(() => registerModule.localDb);
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
