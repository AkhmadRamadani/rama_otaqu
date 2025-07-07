import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/home/repositories/destination_repository.dart';
import 'package:rama_otaqu/modules/home/repositories/recent_search_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnHomePageLoaded>((event, emit) => _onHomePageLoaded(event, emit));
    on<OnClearRecentSearches>(
      (event, emit) => _onClearRecentSearches(event, emit),
    );
  }

  DestinationRepository destinationRepository = getIt<DestinationRepository>();
  RecentSearchRepository recentSearchRepository =
      getIt<RecentSearchRepository>();

  Future<void> _onHomePageLoaded(
    OnHomePageLoaded event,
    Emitter<HomeState> emit,
  ) async {
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
        HomeLoadSuccess(
          destinationsData: destinationsData,
          recentSearchesData: recentSearchesData,
        ),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> _onClearRecentSearches(
    OnClearRecentSearches event,
    Emitter<HomeState> emit,
  ) async {
    await recentSearchRepository.localDb.clear();
    add(OnHomePageLoaded());
  }
}
