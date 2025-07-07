part of 'search_result_bloc.dart';

@immutable
sealed class SearchResultState {}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultLoading extends SearchResultState {}

final class SearchResultFailure extends SearchResultState {
  final String message;
  SearchResultFailure(this.message);
}

final class SearchResultSuccess extends SearchResultState {
  final List<Package> data;
  SearchResultSuccess(this.data);
}
