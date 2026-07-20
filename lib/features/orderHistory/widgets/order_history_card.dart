import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/shared/custom_button.dart';

class OrderHistoryCard extends StatelessWidget {
  final String image;
  final String title;
  final int quantity;
  final String price;
  final VoidCallback? onReorder;

  const OrderHistoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
    this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
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
                            width: AppSizes.spacingWidth110 * 0.85,
                            child: Container(
                              height: AppSizes.spacingHeight4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    blurRadius: AppSizes.spacingWidth8,
                                    spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(
                                  AppSizes.borderRadius24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          image,
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
                      "Order Name: $title",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.textPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Gap(AppSizes.spacingHeight4),
                    Text(
                      "Quantity: $quantity",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.textSecondaryColor,
                          ),
                    ),
                    Gap(AppSizes.spacingHeight4),
                    Text(
                      "Price: \$$price",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.primary,
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
              onTap: onReorder ?? () {},
              width: double.infinity,
              height: AppSizes.spacingHeight45,
            ),
          ],
        ),
      ),
    );
  }
}
