import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      (
        icon: CupertinoIcons.home,
        activeIcon: CupertinoIcons.house_fill,
        label: "Home"
      ),
      (
        icon: CupertinoIcons.bag,
        activeIcon: CupertinoIcons.bag_fill,
        label: "Cart"
      ),
      (
        icon: Icons.restaurant_outlined,
        activeIcon: Icons.restaurant,
        label: "History"
      ),
      (
        icon: CupertinoIcons.person,
        activeIcon: CupertinoIcons.person_fill,
        label: "Profile"
      ),
    ];

    return Material(
      color: Colors.transparent,
      child: Container(
        height: AppSizes.spacingHeight70,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingWidth8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .16),
              blurRadius: AppSizes.spacingWidth20,
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
                borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
                onTap: () => onTap(index),
                child: AnimatedContainer(
                  height: AppSizes.spacingHeight40,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(
                    vertical: AppSizes.spacingHeight6,
                    horizontal: AppSizes.spacingWidth3,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.cardBackground
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadius20),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color:
                                  AppColors.textWhite.withValues(alpha: .24),
                              blurRadius: AppSizes.spacingWidth10,
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
                        color:
                            selected ? AppColors.primary : AppColors.textWhite,
                        size: AppSizes.fontSize22,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        child: selected
                            ? Row(
                                children: [
                                  SizedBox(width: AppSizes.spacingWidth8),
                                  Text(
                                    item.label,
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppSizes.fontSize12,
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