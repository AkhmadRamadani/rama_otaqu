part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoadSuccess extends HomeState {
  final List<DestinationEntityModel> destinationsData;
  final List<DestinationEntityModel> recentSearchesData;
  final String? destinationsDataError;
  final String? recentSearchesDataError;

  HomeLoadSuccess({
    required this.destinationsData,
    required this.recentSearchesData,
    this.destinationsDataError,
    this.recentSearchesDataError,
  });
}

final class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
