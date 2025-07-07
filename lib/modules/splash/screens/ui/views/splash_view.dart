import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/core/assets/gen/assets.gen.dart';
import 'package:rama_otaqu/core/config/route/route_config.gr.dart';
import 'package:rama_otaqu/modules/splash/bloc/splash_bloc.dart';
import 'package:rama_otaqu/modules/splash/screens/ui/components/powered_by_otaqu_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            if (state.showIntro) {
              context.router.replaceAll([const IntroRoute()]);
            } else {
              context.router.replaceAll([const HomeRoute()]);
            }
          } else if (state is SplashFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Assets.images.brands.otaquLogo.image(width: 150, height: 150),
                PoweredByOtaquWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
