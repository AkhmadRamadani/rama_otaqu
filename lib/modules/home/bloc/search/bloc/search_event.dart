part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class OnSearch extends SearchEvent {
  final String query;
  OnSearch(this.query);
}

class OnInitial extends SearchEvent {}