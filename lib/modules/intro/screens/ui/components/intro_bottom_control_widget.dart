import 'package:flutter/material.dart';
import 'package:rama_otaqu/modules/intro/screens/ui/components/animated_circular_indicator_widget.dart';
import 'package:rama_otaqu/modules/intro/screens/ui/components/animated_indicator_widget.dart';

class IntroBottomControlWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final bool isLastPage;
  final Color activeColor;

  const IntroBottomControlWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onSkip,
    required this.onNext,
    required this.isLastPage,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: List.generate(totalPages, (index) {
              return AnimatedIndicatorWidget(
                currentPage: currentPage,
                index: index,
              );
            }),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onSkip,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              AnimatedCircularIndicatorWidget(
                currentPage: currentPage,
                totalPages: totalPages,
                isLastPage: isLastPage,
                activeColor: activeColor,
                onTap: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
