import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, AppSizes.spacingHeight20 * (1 - opacity)),
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryGradientEnd],
                  ),
                ),
                child: CircleAvatar(
                  radius: AppSizes.spacingWidth55,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: AppSizes.fontSize48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: AppSizes.spacingWidth4,
                child: Container(
                  height: AppSizes.iconSize34,
                  width: AppSizes.iconSize34,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: AppSizes.spacingWidth8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: AppColors.primary,
                      width: AppSizes.borderWidth2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                      size: AppSizes.iconSize16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(AppSizes.spacingHeight16),
          Text(
            userName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.textPrimaryColor,
              letterSpacing: 0.5,
            ),
          ),
          Gap(AppSizes.spacingHeight8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingWidth12,
              vertical: AppSizes.spacingHeight6,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
            ),
            child: Text(
              'Gold Member • Since 2025',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppSizes.fontSize12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
