import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/home/widgets/food_card.dart';
import 'package:hungry/features/home/widgets/home_categories.dart';
import 'package:hungry/features/home/widgets/home_header.dart';
import 'package:hungry/features/home/widgets/home_search_bar.dart';
import 'package:hungry/features/product/view/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> foods = List.generate(
    30,
    (index) => {
      'image': 'assets/images/food2.png',
      'title': 'Cheeseburger',
      'restaurant': "Wendy's Burger",
      'rating': 4.9,
    },
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 1)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    AppSizes.spacingHeight110,
                  ),
                  sliver: SliverGrid.builder(
                    itemCount: foods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSizes.spacingHeight8,
                      crossAxisSpacing: AppSizes.spacingWidth8,
                      childAspectRatio: 0.80,
                    ),
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        columnCount: 2,
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDetailsView(),
                                  ),
                                );
                              },
                              child: FoodCard(
                                image: food['image'] as String,
                                title: food['title'] as String,
                                restaurant: food['restaurant'] as String,
                                rating: food['rating'] as double,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
