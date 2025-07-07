part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchIdle extends SearchState {
  final List<DestinationEntityModel> destinationsData;
  final List<DestinationEntityModel> recentSearchesData;
  final String? destinationsDataError;
  final String? recentSearchesDataError;

  SearchIdle({
    required this.destinationsData,
    required this.recentSearchesData,
    this.destinationsDataError,
    this.recentSearchesDataError,
  });
}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure(this.message);
}

final class SearchEmpty extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<DestinationEntityModel> destinationsData;

  SearchSuccess(this.destinationsData);
}
