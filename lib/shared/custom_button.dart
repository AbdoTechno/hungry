import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.spacingWidth250,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.fontSize20,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
