import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class ProductInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingWidth12),
      decoration: BoxDecoration(
        color: context.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize16,
                      color: context.textPrimaryColor,
                    ),
              ),
              Gap(AppSizes.spacingHeight4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.textSecondaryColor,
                      fontSize: AppSizes.fontSize12,
                    ),
              ),
            ],
          ),

          // Quantity Counter
          Container(
            decoration: BoxDecoration(
              color: context.inputFillColor,
              borderRadius: BorderRadius.circular(AppSizes.borderRadius30),
            ),
            child: Row(
              children: [
                IconButton(
                  constraints: BoxConstraints.tight(Size(32.r, 32.r)),
                  padding: EdgeInsets.zero,
                  onPressed: quantity > 1 ? onDecrement : null,
                  icon: Icon(
                    Icons.remove,
                    size: AppSizes.iconSize16,
                    color: quantity > 1
                        ? context.textPrimaryColor
                        : context.textSecondaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingWidth8,
                  ),
                  child: Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSize14,
                          color: context.textPrimaryColor,
                        ),
                  ),
                ),
                IconButton(
                  constraints: BoxConstraints.tight(Size(32.r, 32.r)),
                  padding: EdgeInsets.zero,
                  onPressed: onIncrement,
                  icon: Icon(
                    Icons.add,
                    size: AppSizes.iconSize16,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
