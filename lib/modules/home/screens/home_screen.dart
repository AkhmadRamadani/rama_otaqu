import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/modules/home/bloc/home_bloc.dart';
import 'package:rama_otaqu/modules/home/screens/ui/views/home_view.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeBloc()..add(OnHomePageLoaded()), child: HomeView());
  }
}
