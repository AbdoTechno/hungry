import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final Color? tileColor;

  const PaymentMethodTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final defaultBgColor =
        isSelected ? context.colorScheme.primary : context.tileBackgroundColor;

    return ListTile(
      onTap: () => onChanged(value),
      contentPadding: EdgeInsets.all(AppSizes.spacingWidth16),
      tileColor: tileColor ?? defaultBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textWhite,
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textWhite.withValues(alpha: 0.8),
                  ),
            )
          : null,
      leading: Image.asset(
        imagePath,
        height: AppSizes.spacingHeight40,
      ),
      trailing: Radio<String>(
        activeColor: AppColors.textWhite,
        value: value,
        // ignore: deprecated_member_use
        groupValue: groupValue,
        // ignore: deprecated_member_use
        onChanged: (val) {
          if (val != null) onChanged(val);
        },
      ),
    );
  }
}
