import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.radius,
    this.height,
    this.width,
  });
  final String title;
  final Function()? onTap;
  // radius
  final double? radius;
  // hight
  final double? height;
  // width
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppSizes.spacingWidth250,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(
            radius ?? AppSizes.borderRadius30,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.fontSize18,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
