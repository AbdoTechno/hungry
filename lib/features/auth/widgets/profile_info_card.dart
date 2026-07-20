import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.address,
    required this.password,
  });

  final String name;
  final String email;
  final String address;
  final String password;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
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
      child: _buildCard(
        context,
        title: 'Personal Information',
        children: [
          _buildInfoTile(
            context,
            Icons.person_outline,
            'Name',
            name,
          ),
          _buildInfoTile(
            context,
            Icons.email_outlined,
            'Email',
            email,
          ),
          _buildInfoTile(
            context,
            Icons.location_on_outlined,
            'Delivery address',
            address,
          ),
          _buildInfoTile(
            context,
            Icons.lock_outline,
            'Password',
            password,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingWidth16,
        vertical: AppSizes.spacingHeight20,
      ),
      decoration: BoxDecoration(
        color: context.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSizes.spacingWidth4,
                height: AppSizes.spacingHeight180 * 0.1,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius2),
                ),
              ),
              Gap(AppSizes.spacingWidth8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.textPrimaryColor,
                      fontSize: AppSizes.fontSize16,
                    ),
              ),
            ],
          ),
          Gap(AppSizes.spacingHeight16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.spacingHeight12),
      padding: EdgeInsets.all(AppSizes.spacingWidth12),
      decoration: BoxDecoration(
        color: context.inputFillColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
        border: Border.all(
          color: context.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.spacingWidth10),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: AppSizes.iconSize20,
              color: context.colorScheme.primary,
            ),
          ),
          Gap(AppSizes.spacingWidth12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppSizes.fontSize12,
                    color: context.textSecondaryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
                Gap(AppSizes.spacingHeight2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppSizes.fontSize14,
                    fontWeight: FontWeight.bold,
                    color: context.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: context.textSecondaryColor.withValues(alpha: 0.5),
            size: AppSizes.iconSize20,
          ),
        ],
      ),
    );
  }
}
