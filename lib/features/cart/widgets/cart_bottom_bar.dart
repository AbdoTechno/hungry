import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/shared/custom_button.dart';

class CartBottomBar extends StatelessWidget {
  final String totalPrice;
  final VoidCallback? onCheckout;

  const CartBottomBar({
    super.key,
    required this.totalPrice,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.spacingHeight180,
      padding: EdgeInsets.only(
        left: AppSizes.spacingWidth16,
        right: AppSizes.spacingWidth16,
        bottom: AppSizes.spacingHeight100,
      ),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize20,
                      color: context.textPrimaryColor,
                    ),
              ),
              Gap(AppSizes.spacingHeight8),
              Text(
                totalPrice,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize24,
                      color: context.colorScheme.primary,
                    ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            title: 'Checkout',
            onTap: onCheckout ??
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutView(),
                    ),
                  );
                },
            height: AppSizes.spacingHeight60,
          ),
        ],
      ),
    );
  }
}
