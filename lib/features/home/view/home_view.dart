import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/features/home/widgets/home_categories.dart';
import 'package:hungry/features/home/widgets/home_header.dart';
import 'package:hungry/features/home/widgets/home_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), 

  
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingWidth20,
              vertical: AppSizes.spacingHeight16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Header
                const HomeHeader(),
                Gap(AppSizes.spacingHeight16),
                // Search Bar
                const HomeSearchBar(),
                Gap(AppSizes.spacingHeight24),
                // Categories
                const HomeCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
