part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnHomePageLoaded extends HomeEvent {}

class OnClearRecentSearches extends HomeEvent {}
