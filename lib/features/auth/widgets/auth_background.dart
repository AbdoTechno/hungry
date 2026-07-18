import 'package:flutter/material.dart';
import 'package:hungry/core/theme/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isLogin ? Colors.white : AppColors.primary,
    );
  }
}