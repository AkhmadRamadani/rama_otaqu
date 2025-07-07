import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/search_result/bloc/search_result_bloc.dart';
import 'package:rama_otaqu/modules/search_result/screens/views/search_result_view.dart';

@RoutePage()
class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.data});

  final DestinationEntityModel data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              SearchResultBloc()
                ..add(SearchResultEventStarted(destination: data)),
      child: const SearchResultView(),
    );
  }
}
