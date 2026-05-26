import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: const WidgetStatePropertyAll(3),
      side: WidgetStatePropertyAll(
        BorderSide(color: AppColors.primary.withAlpha(80)),
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
          color: AppColors.primaryDark.withAlpha(120),
          fontSize: AppSizes.fontSize16,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: const Icon(CupertinoIcons.search),
    );
  }
}
