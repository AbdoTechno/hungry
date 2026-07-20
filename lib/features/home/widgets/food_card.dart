import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacingWidth12,
            vertical: AppSizes.spacingHeight8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  image,
                  height: AppSizes.spacingHeight120,
                  fit: BoxFit.contain,
                ),
              ),
              Gap(AppSizes.spacingHeight4),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                restaurant,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.textSecondaryColor,
                ),
              ),
              Gap(AppSizes.spacingHeight4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: AppColors.starRating,
                        size: AppSizes.iconSize16,
                      ),
                      Gap(AppSizes.spacingWidth4),
                      Text(
                        rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: context.textPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.fontSize12,
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
                      color: AppColors.error,
                      size: AppSizes.iconSize16,
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
