import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/checkout/widgets/custom_summary_row.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.deliveryFee,
    required this.total,
  });

  final String order, taxes, deliveryFee, total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingWidth16),
      height: AppSizes.spacingHeight220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.cardBackgroundColor,
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
        ),
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CustomSummaryRow(title: 'Order', price: '40.00'),
          Gap(AppSizes.spacingHeight8),
          const CustomSummaryRow(title: 'Taxes', price: '5.00'),
          Gap(AppSizes.spacingHeight8),
          CustomSummaryRow(
            title: 'Delivery Fee',
            price: deliveryFee,
          ),
          Gap(AppSizes.spacingHeight8),
          Divider(
            color: context.textSecondaryColor.withValues(alpha: .2),
            thickness: 1,
            height: 1,
          ),
          Gap(AppSizes.spacingHeight16),
          CustomSummaryRow(
            title: 'Total',
            price: total,
            color: context.textPrimaryColor,
          ),
          Gap(AppSizes.spacingHeight16),
          CustomSummaryRow(
            title: 'Estimated Delivery Time',
            price: '15 - 20 Mins',
            color: context.textPrimaryColor,
          ),
        ],
      ),
    );
  }
}
