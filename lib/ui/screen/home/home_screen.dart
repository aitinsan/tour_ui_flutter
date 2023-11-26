import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:tours_ui_flutter/domain/model/tour_model.dart';
import 'package:tours_ui_flutter/ui/constants/app_colors.dart';
import 'package:tours_ui_flutter/ui/constants/app_text_styles.dart';
import 'package:tours_ui_flutter/ui/screen/flight/flights_page.dart';
import 'package:tours_ui_flutter/ui/screen/home/widget/home_tour_card_widget.dart';
import 'package:tours_ui_flutter/ui/screen/home/widget/home_tour_dot_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int currentIndex = 0;
  late List<TourModel> tourList;
  @override
  void initState() {
    super.initState();
    tourList = tours;
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
        title: Text(
          'Discover',
          style: AppTextStyles.s16w700.copyWith(color: AppColors.grey),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ExpandablePageView.builder(
                    alignment: Alignment.center,
                    controller: pageController,
                    itemCount: tourList.length,
                    itemBuilder: (context, index) {
                      return HomeTourCardWidget(
                        isSelected: currentIndex == index,
                        tourModel: tourList[index],
                      );
                    },
                  ),
                ),
              ),
              HomeTourDotIndicatorWidget(
                currentDot: currentIndex,
                dotCount: tourList.length,
              ),
            ],
          ),
          const FlightPage(),
        ],
      ),
    );
  }
}
