import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AnimatedCircularIndicatorWidget extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final bool isLastPage;
  final Color activeColor;
  final VoidCallback onTap;

  const AnimatedCircularIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.isLastPage,
    required this.activeColor,
    required this.onTap,
  });

  @override
  State<AnimatedCircularIndicatorWidget> createState() =>
      _AnimatedCircularIndicatorWidgetState();
}

class _AnimatedCircularIndicatorWidgetState
    extends State<AnimatedCircularIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _currentPercent = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: (widget.currentPage + 1) / widget.totalPages,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animation.addListener(() {
      setState(() {
        _currentPercent = _animation.value;
      });
    });

    _animationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedCircularIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPage != widget.currentPage) {
      final newPercent = (widget.currentPage + 1) / widget.totalPages;
      _animation = Tween<double>(
        begin: _currentPercent,
        end: newPercent,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );

      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _animationController.isAnimating ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 5.0,
          percent: _currentPercent,
          animation: false,
          center: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                widget.isLastPage ? Icons.check : Icons.arrow_forward,
                key: ValueKey(widget.isLastPage),
                color: widget.activeColor,
                size: 24.0,
              ),
            ),
          ),
          backgroundColor: Colors.white.withAlpha(50),
          progressColor: Colors.white,
        ),
      ),
    );
  }
}
