part of 'intro_bloc.dart';

@immutable
sealed class IntroEvent {}

final class OnIntroPageChanged extends IntroEvent {
  final int currentPage;

  OnIntroPageChanged(this.currentPage);
}

final class OnIntroCompleted extends IntroEvent {
  final bool completed;

  OnIntroCompleted(this.completed);
}
