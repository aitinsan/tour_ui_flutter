import 'package:flutter/material.dart';
import 'package:tours_ui_flutter/domain/model/tour_model.dart';
import 'package:tours_ui_flutter/ui/constants/app_animation.dart';
import 'package:tours_ui_flutter/ui/constants/app_colors.dart';
import 'package:tours_ui_flutter/ui/constants/app_text_styles.dart';

class HomeTourCardWidget extends StatelessWidget {
  const HomeTourCardWidget(
      {super.key, required this.isSelected, required this.tourModel});
  final bool isSelected;
  final TourModel tourModel;
  final double photoesSize = 36.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: AppAnimation.duration,
                height: isSelected ? 250 : 250 * 0.75,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    Container(
                      height: photoesSize,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          _buildAvatar(),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: _buildPhotoesList(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    _buildTextRow(),
                    Text(
                      tourModel.title,
                      style: AppTextStyles.s24w700,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildImage(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    double size = 250;
    return SizedBox(
      height: size,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                tourModel.mainImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIcon(
                  icon: Icons.remove_red_eye,
                  text: tourModel.views.toString(),
                ),
                _buildIcon(
                  icon: Icons.favorite,
                  text: tourModel.likesCount.toString(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.grey,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppTextStyles.s12w700.copyWith(
            color: AppColors.white,
          ),
        )
      ],
    );
  }

  Widget _buildTextRow() {
    return Row(
      children: [
        Text(
          tourModel.location,
          style: AppTextStyles.s12w500.copyWith(color: AppColors.grey),
        ),
        Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 6),
          height: 2,
          width: 2,
          color: AppColors.grey,
        ),
        Text(
          tourModel.duration,
          style: AppTextStyles.s12w500.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 12,
      backgroundImage: NetworkImage(
        tourModel.user.image,
      ),
    );
  }

  Widget _buildPhotoesList() {
    return SizedBox(
      height: photoesSize,
      child: ListView.separated(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tourModel.imageList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              tourModel.imageList[index],
              height: photoesSize,
              width: photoesSize,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
