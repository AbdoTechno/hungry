import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(AppSizes.spacingHeight20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Side: Brand Logo and Welcome Message
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/hungry.svg',
                  width: 140.w,
                  height: 36.h,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(AppSizes.spacingHeight4),
                Text(
                  'Hello, Abdo Techno',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: AppSizes.fontSize16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Right Side: Profile Avatar
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Container(
                  width: 60.r,
                  height: 60.r,
                  color: context.colorScheme.primary.withValues(alpha: 0.15),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: context.colorScheme.primary,
                      size: AppSizes.iconSize24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
