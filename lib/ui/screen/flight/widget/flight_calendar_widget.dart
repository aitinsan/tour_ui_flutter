import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tours_ui_flutter/ui/constants/app_colors.dart';
import 'package:collection/collection.dart';
import 'package:tours_ui_flutter/ui/constants/app_text_styles.dart';

class FlightCalendarWidget extends StatefulWidget {
  const FlightCalendarWidget({super.key});

  @override
  State<FlightCalendarWidget> createState() => _FlightCalendarWidgetState();
}

class _FlightCalendarWidgetState extends State<FlightCalendarWidget> {
  List<int> numberList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildGraphics(),
              ),
              Padding(
                padding: EdgeInsets.only(top: numberList.average * 0.5),
                child: const DottedLine(
                  dashColor: AppColors.grey,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          _buildMonthDays(),
        ],
      ),
    );
  }

  Color _getColor({
    required int value,
  }) {
    switch (value) {
      case < 33:
        return AppColors.darkPurple;

      case < 66:
        return AppColors.lightPurple;

      default:
        return AppColors.purple;
    }
  }

  List<Widget> _buildGraphics() {
    List<Widget> listOfGraphs = [];
    for (var i = 0; i < 30; i++) {
      final number = Random().nextInt(75) + 25;

      numberList.add(number);

      listOfGraphs.add(
        Container(
          height: number * 0.5,
          width: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getColor(
              value: number.toInt(),
            ),
          ),
        ),
      );
    }
    return listOfGraphs;
  }

  Widget _buildMonthDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '1',
          style: AppTextStyles.s10w500,
        ),
        _buildMonthDaysSpacing(true),
        _buildMonthDaysSpacing(false),
        _buildMonthDaysSpacing(true),
        const Text(
          '15',
          style: AppTextStyles.s10w500,
        ),
        _buildMonthDaysSpacing(true),
        _buildMonthDaysSpacing(false),
        _buildMonthDaysSpacing(true),
        const Text(
          '30',
          style: AppTextStyles.s10w500,
        ),
      ],
    );
  }

  Widget _buildMonthDaysSpacing(bool small) {
    return Container(
      height: small ? 5 : 10,
      width: 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.lightGrey),
    );
  }
}
