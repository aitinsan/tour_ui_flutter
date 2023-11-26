import 'package:flutter/material.dart';
import 'package:tours_ui_flutter/ui/constants/app_animation.dart';
import 'package:tours_ui_flutter/ui/constants/app_colors.dart';

class HomeTourDotIndicatorWidget extends StatefulWidget {
  const HomeTourDotIndicatorWidget({
    super.key,
    required this.dotCount,
    required this.currentDot,
  });
  final int dotCount;
  final int currentDot;

  @override
  State<HomeTourDotIndicatorWidget> createState() =>
      _HomeTourDotIndicatorWidgetState();
}

class _HomeTourDotIndicatorWidgetState
    extends State<HomeTourDotIndicatorWidget> {
  final double size = 5;
  @override
  void initState() {
    super.initState();
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: widget.currentDot == index ? size * 8 : size,
      height: widget.currentDot == index ? size * 1.5 : size,
      duration: AppAnimation.duration,
      decoration: BoxDecoration(
        color: widget.currentDot == index
            ? AppColors.purple
            : AppColors.lightPurple,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(
      widget.dotCount,
      (i) => _buildDot(i),
    );
    return Container(
      margin: const EdgeInsets.only(
        bottom: 160,
      ),
      height: size * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dotsList,
      ),
    );
  }
}
