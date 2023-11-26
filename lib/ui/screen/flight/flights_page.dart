import 'package:flutter/material.dart';
import 'package:tours_ui_flutter/ui/constants/app_animation.dart';
import 'package:tours_ui_flutter/ui/constants/app_colors.dart';
import 'package:tours_ui_flutter/ui/constants/app_text_styles.dart';
import 'package:tours_ui_flutter/ui/screen/flight/widget/flight_calendar_widget.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 1,
      snap: true,
      snapAnimationDuration: AppAnimation.duration,
      snapSizes: const [
        0.15,
        1,
      ],
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 60,
                    height: 5,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildTypeFilterList(),
                const SizedBox(
                  height: 30,
                ),
                _buildAppBar(scrollController),
                const SizedBox(
                  height: 40,
                ),
                const FlightCalendarWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTypeFilterList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTimeFilter(
          text: "T",
          isSelected: false,
        ),
        _buildTimeFilter(
          text: "W",
          isSelected: false,
        ),
        _buildTimeFilter(
          text: "M",
          isSelected: true,
        ),
        _buildTimeFilter(
          text: "Y",
          isSelected: false,
        ),
      ],
    );
  }

  Widget _buildTimeFilter({
    required String text,
    required bool isSelected,
  }) {
    return Column(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.purple : null,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: isSelected ? AppColors.black : AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(ScrollController ctrl) {
    return Row(
      children: [
        const AnimatedRotation(
          turns: 1,
          duration: AppAnimation.duration,
          child: Icon(
            Icons.calendar_today_outlined,
            color: AppColors.lightGrey,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                'Price',
                style: AppTextStyles.s12w700,
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Jan,2020',
                  style: AppTextStyles.s12w700.copyWith(
                    color: AppColors.grey,
                  )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.darkGrey,
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}
