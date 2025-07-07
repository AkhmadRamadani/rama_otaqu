import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/modules/intro/bloc/intro_bloc.dart';
import 'package:rama_otaqu/modules/intro/screens/ui/views/intro_view.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IntroBloc(),
      child: const IntroView(),
    );
  }
}
