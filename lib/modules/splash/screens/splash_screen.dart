import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/modules/splash/bloc/splash_bloc.dart';
import 'package:rama_otaqu/modules/splash/screens/ui/views/splash_view.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(SplashStarted()),
      child: const SplashView(),
    );
  }
}
