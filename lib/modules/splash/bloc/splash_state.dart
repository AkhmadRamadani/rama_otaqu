part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashSuccess extends SplashState {
  final bool showIntro;
  SplashSuccess(this.showIntro);
}

final class SplashFailure extends SplashState {
  final String message;
  SplashFailure(this.message);
}
