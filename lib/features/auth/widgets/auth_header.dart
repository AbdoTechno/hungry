import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.isLogin,
    required this.subtitle,
  });

  final bool isLogin;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final color = isLogin ? AppColors.primary : Colors.white;

    return Column(
      children: [
        Text(
          'HUNGRY?',
          style: TextStyle(
            fontFamily: 'LuckiestGuy-Regular',
            fontSize: 48,
            color: color,
            letterSpacing: 2,
          ),
        ),
        Gap(AppSizes.spacingHeight8),
        Text(
          subtitle,
          style: TextStyle(
            color: isLogin ? AppColors.textSecondary : Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(AppSizes.spacingHeight32),
      ],
    );
  }
}