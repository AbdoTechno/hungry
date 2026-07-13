import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/home/widgets/food_card.dart';
import 'package:hungry/features/home/widgets/home_categories.dart';
import 'package:hungry/features/home/widgets/home_header.dart';
import 'package:hungry/features/home/widgets/home_search_bar.dart';
import 'package:hungry/features/product/view/product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingWidth16,
                    vertical: AppSizes.spacingHeight16,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const HomeHeader(),
                      Gap(AppSizes.spacingHeight16),
                      const HomeSearchBar(),
                      Gap(AppSizes.spacingHeight24),
                      const HomeCategories(),
                      Gap(AppSizes.spacingHeight16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  AppSizes.spacingWidth20,
                  0,
                  AppSizes.spacingWidth20,
                  110.h,
                ),
                sliver: SliverGrid.builder(
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsView(),
                            ),
                          );
                        },
                        child: FoodCard(
                          image: 'assets/images/food2.png',
                          title: 'Cheeseburger',
                          restaurant: "Wendy's Burger",
                          rating: 4.9,
                        ),
                      ),
                  itemCount: 10,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            AppSizes.spacingHeight8,
                        crossAxisSpacing:
                            AppSizes.spacingWidth8,
                        childAspectRatio: 0.80,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
