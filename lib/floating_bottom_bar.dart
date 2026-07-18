import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class FloatingBottomBar extends StatelessWidget {
  const FloatingBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      (icon: CupertinoIcons.home, activeIcon: CupertinoIcons.house_fill, label: "Home"),
      (icon: CupertinoIcons.bag, activeIcon: CupertinoIcons.bag_fill, label: "Cart"),
      (icon: Icons.restaurant_outlined, activeIcon: Icons.restaurant, label: "History"),
      (icon: CupertinoIcons.person, activeIcon: CupertinoIcons.person_fill, label: "Profile"),
    ];

    return Material(
      color: Colors.transparent,
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(26.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .16),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(22.r),
                onTap: () => onTap(index),
                child: AnimatedContainer(
                  height: AppSizes.spacingHeight40,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(
                    vertical: 7.h,
                    horizontal: 3.w,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: .24),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selected ? item.activeIcon : item.icon,
                        color: selected ? AppColors.primary : Colors.white,
                        size: 22.sp,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        child: selected
                            ? Row(
                                children: [
                                  SizedBox(width: 8.w),
                                  Text(
                                    item.label,
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}