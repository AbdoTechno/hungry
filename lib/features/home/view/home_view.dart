import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacingWidth20,
            vertical: AppSizes.spacingHeight16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Row
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
                        colorFilter: const ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(AppSizes.spacingHeight4),
                      Text(
                        'Hello, Abdo Techno',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: AppSizes.fontSize16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // Right Side: Perfectly Circular Profile Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withAlpha(40),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primary.withAlpha(20),
                      backgroundImage: const NetworkImage(
                        'https://media.licdn.com/dms/image/v2/D4D03AQElTqd4x3zyiA/profile-displayphoto-scale_100_100/B4DZ3DlyiBH8Ac-/0/1777102959485?e=1781136000&v=beta&t=cAS_V77sl2sdBuD37rKeLaXWiZdiZ_lcW4zdpwo4c2k',
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: 24.r,
                      ),
                    ),
                  ),
                ],
              ), // 2. Greeting Section
            ],
          ),
        ),
      ),
    );
  }
}
