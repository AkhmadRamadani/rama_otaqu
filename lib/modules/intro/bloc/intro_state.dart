part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {}

final class IntroLoading extends IntroState {}

final class IntroSuccess extends IntroState {
  final int currentPage;
  IntroSuccess({this.currentPage = 0});
}

final class IntroFailure extends IntroState {
  final String error;

  IntroFailure(this.error);
}

final class IntroCompleted extends IntroState {
  final bool completed;

  IntroCompleted(this.completed);
}
