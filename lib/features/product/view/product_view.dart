import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';

import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';
import 'package:hungry/features/product/widgets/toppings_card.dart';
import 'package:hungry/shared/custom_button.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() =>
      _ProductDetailsViewState();
}

class _ProductDetailsViewState
    extends State<ProductDetailsView> {
  double value = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
              ),
              Gap(AppSizes.spacingHeight60),
              Text(
                'Toppings',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize20,
                    ),
              ),
              Gap(AppSizes.spacingHeight16),
              // Toppings Card
              SizedBox(
                height: AppSizes.spacingHeight130,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, _) =>
                      Gap(AppSizes.spacingWidth16),
                  itemBuilder: (context, index) {
                    return ToppingsCard(
                      image: 'assets/images/tomato.png',
                      title: 'Toppings ',
                      onAdd: () {},
                    );
                  },
                ),
              ),
              Gap(AppSizes.spacingHeight16),
              Text(
                'Side Options',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize20,
                    ),
              ),
              Gap(AppSizes.spacingHeight16),
              // Toppings Card
              SizedBox(
                height: AppSizes.spacingHeight130,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, _) =>
                      Gap(AppSizes.spacingWidth16),
                  itemBuilder: (context, index) {
                    return ToppingsCard(
                      image: 'assets/images/onion.png',
                      title: 'Toppings ',
                      onAdd: () {},
                      buttonColor: AppColors.primaryLight,
                    );
                  },
                ),
              ),
              Gap(AppSizes.spacingHeight112),
              Row(
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSize20,
                            ),
                      ),
                      Gap(AppSizes.spacingHeight8),
                      Text(
                        '\$12.00',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSize24,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    title: 'Add to Cart',
                    onTap: () {},
                  ),
                ],
              ),
              Gap(AppSizes.spacingHeight90),
              // Toppings Card
            ],
          ),
        ),
      ),
    );
  }
}
