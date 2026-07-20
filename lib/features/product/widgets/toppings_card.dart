import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class ToppingsCard extends StatelessWidget {
  final String image;
  final String title;
  final String? price;
  final bool isSelected;
  final VoidCallback? onAdd;
  final VoidCallback? onTap;
  final Color? buttonColor;

  const ToppingsCard({
    super.key,
    required this.image,
    required this.title,
    this.price,
    this.isSelected = false,
    this.onAdd,
    this.onTap,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = buttonColor ?? context.colorScheme.primary;

    return GestureDetector(
      onTap: onTap ?? onAdd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: AppSizes.spacingWidth105,
        decoration: BoxDecoration(
          color: context.tileBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
          border: Border.all(
            color: isSelected ? activeColor : Colors.transparent,
            width: AppSizes.borderWidth2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? activeColor.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Container
            Container(
              height: AppSizes.spacingHeight72,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.cardBackgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(AppSizes.spacingWidth8),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

            // Title, Price, & Action Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingWidth8,
                vertical: AppSizes.spacingHeight6,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontSize: AppSizes.fontSize12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Gap(AppSizes.spacingWidth4),
                      GestureDetector(
                        onTap: onAdd ?? onTap,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: AppSizes.iconSize24,
                          height: AppSizes.iconSize24,
                          decoration: BoxDecoration(
                            color: activeColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isSelected ? Icons.check : Icons.add,
                            color: Colors.white,
                            size: AppSizes.iconSize16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (price != null) ...[
                    Gap(AppSizes.spacingHeight2),
                    Text(
                      price!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isSelected
                                ? context.colorScheme.primary
                                : Colors.white70,
                            fontSize: AppSizes.fontSize10,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
