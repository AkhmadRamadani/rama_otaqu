part of 'search_result_bloc.dart';

@immutable
sealed class SearchResultEvent {}

class SearchResultEventStarted extends SearchResultEvent {
  final DestinationEntityModel destination;
  SearchResultEventStarted({required this.destination});
}
