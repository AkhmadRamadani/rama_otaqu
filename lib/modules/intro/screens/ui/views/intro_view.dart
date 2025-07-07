import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rama_otaqu/core/assets/gen/assets.gen.dart';
import 'package:rama_otaqu/core/config/route/route_config.gr.dart';
import 'package:rama_otaqu/core/themes/app_colors_theme.dart';
import 'package:rama_otaqu/modules/intro/bloc/intro_bloc.dart';
import 'package:rama_otaqu/modules/intro/models/intro_data_model.dart';
import 'package:rama_otaqu/modules/intro/screens/ui/components/carousel_item_widget.dart';
import 'package:rama_otaqu/modules/intro/screens/ui/components/intro_bottom_control_widget.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final CarouselSliderController _sliderController = CarouselSliderController();

  // Your Intro content
  final List<IntroDataModel> _introDataItems = [
    IntroDataModel(
      title: 'Your dream destination is closer than you think.',
      description:
          'From spontaneous weekend trips to bucket-list adventures, your next journey starts with a single tap.',
      imagePath: Assets.images.illustrations.illustrationBoard1.path,
      backgroundColor: AppColorsTheme.pink,
    ),
    IntroDataModel(
      title: 'Thousands of options, one single app.',
      description:
          'Explore the world\'s best flights, hotels, and unique local experiences, all curated for you.',
      imagePath: Assets.images.illustrations.illustrationBoard2.path,
      backgroundColor: AppColorsTheme.yellow,
    ),
    IntroDataModel(
      title: 'Book with confidence, no hidden fees.',
      description:
          'We believe in transparent pricing. The price you see is the price you pay, so you can travel with peace of mind.',
      imagePath: Assets.images.illustrations.illustrationBoard3.path,
      backgroundColor: AppColorsTheme.purple,
    ),
    IntroDataModel(
      title: 'From solo backpacking to luxury resorts.',
      description:
          'Whatever your travel style, find the perfect fit and create memories that will last a lifetime.',
      imagePath: Assets.images.illustrations.illustrationBoard4.path,
      backgroundColor: AppColorsTheme.cyan,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroBloc, IntroState>(
      listener: (context, state) {
        if (state is IntroCompleted) {
          context.router.replaceAll([const HomeRoute()]);
        }
      },
      child: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
          final currentPage = state is IntroSuccess ? state.currentPage : 0;
          final currentItem = _introDataItems[currentPage];

          return Scaffold(
            backgroundColor: currentItem.backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      carouselController: _sliderController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          context.read<IntroBloc>().add(
                            OnIntroPageChanged(index),
                          );
                        },
                      ),
                      items:
                          _introDataItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return CarouselItemWidget(item: item);
                              },
                            );
                          }).toList(),
                    ),
                  ),
                  IntroBottomControlWidget(
                    currentPage: currentPage,
                    totalPages: _introDataItems.length,
                    isLastPage: currentPage == _introDataItems.length - 1,
                    activeColor: currentItem.backgroundColor,
                    onSkip: () {
                      context.read<IntroBloc>().add(OnIntroCompleted(true));
                    },
                    onNext: () {
                      if (currentPage == _introDataItems.length - 1) {
                        context.read<IntroBloc>().add(OnIntroCompleted(true));
                      } else {
                        _sliderController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
