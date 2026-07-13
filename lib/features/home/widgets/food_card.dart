import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.restaurant,
    required this.rating,
  });

  final String image;
  final String title;
  final String restaurant;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.spacingWidth150,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spacingWidth16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  image,
                  width: AppSizes.spacingWidth120,
                ),
              ),
              Gap(AppSizes.spacingHeight10),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                      color: AppColors.textPrimary,
                    ),
              ),
              Text(
                restaurant,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                      color: AppColors.textPrimary,
                    ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amberAccent,
                        size: 18,
                      ),
                      Gap(AppSizes.spacingHeight10),
                      Text(
                        rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle favorite button tap
                    },
                    child: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.redAccent,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
