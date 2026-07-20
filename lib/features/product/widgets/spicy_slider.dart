import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  String _getSpicyLevelText(double value) {
    if (value <= 0.25) return 'Mild 🥶';
    if (value <= 0.50) return 'Medium 🌶️';
    if (value <= 0.75) return 'Spicy 🌶️🔥';
    return 'Hot & Spicy 💥🔥';
  }

  Color _getSpicyColor(BuildContext context, double value) {
    if (value <= 0.25) return Colors.blueAccent;
    if (value <= 0.50) return context.colorScheme.primary;
    if (value <= 0.75) return Colors.deepOrange;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    final spicyText = _getSpicyLevelText(value);
    final spicyColor = _getSpicyColor(context, value);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side Burger Image
        Expanded(
          flex: 4,
          child: Hero(
            tag: 'product_image_burger',
            child: Image.asset(
              'assets/images/burger_details.png',
              height: AppSizes.spacingHeight200,
              fit: BoxFit.contain,
            ),
          ),
        ),

        Gap(AppSizes.spacingWidth12),

        // Right side Customization & Spicy Slider
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Customize\nSpiciness Level',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize16,
                      color: context.textPrimaryColor,
                      height: 1.2,
                    ),
              ),
              Gap(AppSizes.spacingHeight8),

              // Dynamic Spicy Label Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingWidth10,
                  vertical: AppSizes.spacingHeight4,
                ),
                decoration: BoxDecoration(
                  color: spicyColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
                ),
                child: Text(
                  spicyText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: spicyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSize12,
                      ),
                ),
              ),

              Gap(AppSizes.spacingHeight12),

              // Slider Widget
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: AppSizes.spacingHeight6,
                  activeTrackColor: spicyColor,
                  inactiveTrackColor: context.borderColor,
                  thumbColor: spicyColor,
                  overlayColor: spicyColor.withValues(alpha: 0.2),
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: AppSizes.borderRadius10,
                  ),
                ),
                child: Slider(
                  value: value,
                  onChanged: onChanged,
                  min: 0,
                  max: 1,
                ),
              ),

              // Emoji Scale Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '🥶 Mild',
                    style: TextStyle(
                      fontSize: AppSizes.fontSize12,
                      color: context.textSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Hot 💥',
                    style: TextStyle(
                      fontSize: AppSizes.fontSize12,
                      color: context.textSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
