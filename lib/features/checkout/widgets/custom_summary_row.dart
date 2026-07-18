import 'package:flutter/material.dart';
import 'package:hungry/core/theme/app_colors.dart';

class CustomSummaryRow extends StatelessWidget {
  const CustomSummaryRow({
    super.key,
    required this.title,
    required this.price,
    this.color,
  });
  final String title;
  final String price;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(
                color: color ?? AppColors.textSecondary,
              ),
        ),
        Text(
          '\$$price',
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(
                color: color ?? AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}
