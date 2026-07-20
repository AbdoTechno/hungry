import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStatePropertyAll(context.cardBackgroundColor),
      elevation: const WidgetStatePropertyAll(2),
      side: WidgetStatePropertyAll(
        BorderSide(
          color: context.colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadius20,
          ),
        ),
      ),
      hintText: 'Search your favourite food...',
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: context.textSecondaryColor,
          fontSize: AppSizes.fontSize14,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        CupertinoIcons.search,
        color: context.colorScheme.primary,
        size: AppSizes.iconSize20,
      ),
    );
  }
}
