import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/home/repositories/destination_repository.dart';
import 'package:rama_otaqu/modules/home/repositories/recent_search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<OnSearch>(_onSearch);
    on<OnInitial>(_onInitial);
  }

  DestinationRepository get destinationRepository =>
      getIt<DestinationRepository>();
  RecentSearchRepository recentSearchRepository =
      getIt<RecentSearchRepository>();

  Future<void> _onSearch(OnSearch event, Emitter<SearchState> emit) async {
    try {
      var data = await destinationRepository.filterData(event.query);
      data.fold(
        (l) => emit(SearchFailure(l.message)),
        (r) => emit(SearchSuccess(r)),
      );
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  Future<void> _onInitial(OnInitial event, Emitter<SearchState> emit) async {
    try {
      final destinationResult = await destinationRepository.getData();
      final recentResult = await recentSearchRepository.getData();

      final destinationsData = destinationResult.fold((l) {
        log('Destination error: ${l.message}');
        return <DestinationEntityModel>[];
      }, (r) => r);

      final recentSearchesData = recentResult.fold((l) {
        log('Recent search error: ${l.message}');
        return <DestinationEntityModel>[];
      }, (r) => r);

      emit(
        SearchIdle(
          destinationsData: destinationsData,
          recentSearchesData: recentSearchesData,
        ),
      );
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
