import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/services/databases/helpers/recent_search_db_helper.dart';
import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';
import 'package:rama_otaqu/core/services/databases/mappers/destination_mapper.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/search_result/models/list_avail_response_model.dart';
import 'package:rama_otaqu/modules/search_result/repositories/search_result_repository.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultInitial()) {
    on<SearchResultEventStarted>(_onStarted);
  }

  SearchResultRepository searchResultRepository =
      getIt<SearchResultRepository>();

  RecentSearchDbHelper recentSearchDbHelper = getIt<RecentSearchDbHelper>();

  DestinationMapper mapper = getIt<DestinationMapper>();

  Future<void> _onStarted(
    SearchResultEventStarted event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(SearchResultLoading());
    DestinationLocalModel destinationLocalModel =
        event.destination.toDestinationLocalModel();
    recentSearchDbHelper.saveRecentSearches([destinationLocalModel]);
    final data = await searchResultRepository.fetchSearchResult(
      data: event.destination,
    );
    data.fold(
      (l) => emit(SearchResultFailure(l.message)),
      (r) => emit(SearchResultSuccess(r.data?.packages ?? [])),
    );
  }
}
