import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/shared/custom_button.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.spacingWidth16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: Gap(AppSizes.spacingHeight16)),
              SliverList.separated(
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    Gap(AppSizes.spacingHeight16),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.spacingWidth16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        bottom: AppSizes.spacingHeight12,
                                        child: SizedBox(
                                          width:
                                              AppSizes.spacingWidth110 * 0.85,
                                          child: Container(
                                            height: AppSizes.spacingHeight4,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.25),
                                                  blurRadius:
                                                      AppSizes.spacingWidth8,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppSizes.borderRadius24,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/food2.png",
                                        height: AppSizes.spacingHeight100,
                                        width: AppSizes.spacingWidth110,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order Name: Hamburger",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: context.textPrimaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Gap(AppSizes.spacingHeight4),
                                  Text(
                                    "Quantity: 1",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                  Gap(AppSizes.spacingHeight4),
                                  Text(
                                    "Price: \$12.99",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(AppSizes.spacingHeight16),
                          CustomButton(
                            title: "Reorder",
                            onTap: () {},
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(child: Gap(AppSizes.spacingHeight60)),
            ],
          ),
        ),
      ),
    );
  }
}
