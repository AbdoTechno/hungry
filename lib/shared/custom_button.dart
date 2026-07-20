import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.radius,
    this.height,
    this.width,
    this.color,
    this.fontSize,
  });

  final String title;
  final Function()? onTap;
  final double? radius;
  final double? height;
  final double? width;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final defaultFontSize = fontSize ??
        (height != null && height! <= AppSizes.spacingHeight45
            ? AppSizes.fontSize14
            : AppSizes.fontSize18);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppSizes.spacingWidth250,
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingWidth12,
          vertical: height != null ? 0 : AppSizes.spacingHeight12,
        ),
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            radius ?? AppSizes.borderRadius30,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.visible,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: defaultFontSize,
                color: Colors.white,
                height: 1.1,
              ),
        ),
      ),
    );
  }
}
