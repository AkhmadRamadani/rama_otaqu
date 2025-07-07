import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/services/databases/helpers/bool_db_helper.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroSuccess()) {
    on<OnIntroPageChanged>(_onPageChanged);
    on<OnIntroCompleted>(_onOnboardingCompleted);
  }

  final boolDbHelper = getIt.get<BoolDbHelper>();

  Future<void> _onPageChanged(
    OnIntroPageChanged event,
    Emitter<IntroState> emit,
  ) async {
    emit(IntroSuccess(currentPage: event.currentPage));
  }

  Future<void> _onOnboardingCompleted(
    OnIntroCompleted event,
    Emitter<IntroState> emit,
  ) async {
    boolDbHelper.putBool('showIntro', false);
    emit(IntroCompleted(true));
  }
}
