import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/shared/custom_button.dart';

class ProductBottomBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onAddToCart;
  final String buttonTitle;

  const ProductBottomBar({
    super.key,
    required this.totalPrice,
    required this.onAddToCart,
    this.buttonTitle = 'Add to Cart',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.spacingHeight110,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingWidth16,
        vertical: AppSizes.spacingHeight16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
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
                    ),
              ),
              Gap(AppSizes.spacingHeight8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  key: ValueKey<double>(totalPrice),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSize24,
                      ),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            title: buttonTitle,
            onTap: onAddToCart,
            height: AppSizes.spacingHeight60,
          ),
        ],
      ),
    );
  }
}
