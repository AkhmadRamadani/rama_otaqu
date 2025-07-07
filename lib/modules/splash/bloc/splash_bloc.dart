import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/services/databases/helpers/bool_db_helper.dart';
import 'package:rama_otaqu/modules/home/repositories/destination_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  BoolDbHelper get boolDbHelper => getIt.get<BoolDbHelper>();
  DestinationRepository get destinationRepository =>
      getIt.get<DestinationRepository>();

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());
    try {
      final bool showIntro = boolDbHelper.getBool('showIntro') ?? true;
      await destinationRepository.getData();

      Future.delayed(const Duration(seconds: 2));

      emit(SplashSuccess(showIntro));
    } catch (e) {
      emit(SplashFailure(e.toString()));
    }
  }
}
