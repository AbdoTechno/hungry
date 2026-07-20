import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class ToppingsCard extends StatelessWidget {
  final String image;
  final String title;
  final String? price;
  final bool isSelected;
  final VoidCallback? onAdd;
  final VoidCallback? onTap;
  final Color buttonColor;

  const ToppingsCard({
    super.key,
    required this.image,
    required this.title,
    this.price,
    this.isSelected = false,
    this.onAdd,
    this.onTap,
    this.buttonColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? onAdd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 105.w,
        decoration: BoxDecoration(
          color: AppColors.tileColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: AppSizes.borderWidth2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.25)
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
              height: 72.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8.r),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

            // Title, Price, & Action Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingWidth8,
                vertical: 6.h,
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
                                color: AppColors.textWhite,
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
                          width: 24.r,
                          height: 24.r,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : buttonColor,
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
                                ? AppColors.primaryLight
                                : Colors.white70,
                            fontSize: 10.sp,
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
