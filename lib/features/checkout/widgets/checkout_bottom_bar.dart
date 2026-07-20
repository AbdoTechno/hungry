import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/checkout/widgets/success_dialog.dart';
import 'package:hungry/shared/custom_button.dart';

class CheckoutBottomBar extends StatelessWidget {
  final String totalPrice;
  final VoidCallback? onPayNow;

  const CheckoutBottomBar({
    super.key,
    required this.totalPrice,
    this.onPayNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.spacingHeight120,
      padding: EdgeInsets.all(AppSizes.spacingWidth16),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.borderRadius24),
        ),
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.textSecondaryColor,
                      fontSize: AppSizes.fontSize12,
                    ),
              ),
              Gap(AppSizes.spacingHeight4),
              Text(
                totalPrice,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSize24,
                    ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            title: "Pay Now",
            onTap: onPayNow ??
                () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const SuccessDialog(),
                  );
                },
            height: AppSizes.spacingHeight60,
          ),
        ],
      ),
    );
  }
}
