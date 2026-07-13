import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final double value;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/burger_details.png',
          height: AppSizes.spacingHeight290,
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize Your Burger\n to Your Taste\n Ultimate Experience',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(),
            ),
            Gap(AppSizes.spacingHeight24),
            Slider(
              padding: EdgeInsets.only(
                right: AppSizes.spacingWidth16,
              ),
              value: value,
              onChanged: onChanged,
              min: 0,
              max: 1,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.textSecondary,
              thumbColor: AppColors.primaryLight,
              divisions: 8,
              label: 'Customize Your Burger',
            ),
            Gap(AppSizes.spacingHeight8),
            Row(
              children: [
                Text(
                  '🥶',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(),
                ),
                Gap(AppSizes.spacingWidth150),

                Text(
                  '🌶️',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
