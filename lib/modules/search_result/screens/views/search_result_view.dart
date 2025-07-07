import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/modules/search_result/bloc/search_result_bloc.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Result')),
      body: BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SearchResultFailure) {
            return Center(child: Text(state.message));
          }

          if (state is SearchResultSuccess && state.data.isEmpty) {
            return const Center(child: Text('No results found'));
          }

          if (state is SearchResultSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index].name ?? ""),
                  subtitle: Text(state.data[index].packageTypeName ?? ""),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
