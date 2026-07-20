import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class ProductSectionHeader extends StatelessWidget {
  final String title;
  final int selectedCount;
  final Color badgeColor;

  const ProductSectionHeader({
    super.key,
    required this.title,
    this.selectedCount = 0,
    this.badgeColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.fontSize18,
              ),
        ),
        if (selectedCount > 0)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingWidth8,
              vertical: AppSizes.spacingHeight2,
            ),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
            ),
            child: Text(
              '$selectedCount selected',
              style: TextStyle(
                color: badgeColor,
                fontSize: AppSizes.fontSize12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
