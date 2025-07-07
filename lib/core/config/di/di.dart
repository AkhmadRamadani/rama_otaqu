import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rama_otaqu/core/config/di/di.config.dart';
import 'package:rama_otaqu/core/services/databases/helpers/bool_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/destination_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/recent_search_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/helpers/token_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/local_db.dart';
import 'package:rama_otaqu/core/services/databases/mappers/destination_mapper.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @singleton
  TokenDbHelper get tokenDbHelper => TokenDbHelper();

  @singleton
  DestinationDbHelper get destinationDbHelper => DestinationDbHelper();

  @singleton
  RecentSearchDbHelper get recentSearchDbHelper => RecentSearchDbHelper();

  @singleton
  DestinationMapper get destinationMapper => DestinationMapper();

  @singleton
  BoolDbHelper get boolDbHelper => BoolDbHelper();

  @singleton
  LocalDb get localDb => LocalDb();
}

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
