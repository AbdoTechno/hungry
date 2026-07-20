import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/checkout/widgets/checkout_bottom_bar.dart';
import 'package:hungry/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry/features/checkout/widgets/payment_method_tile.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: context.textPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        backgroundColor: context.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: context.textPrimaryColor,
            size: AppSizes.iconSize24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.spacingWidth16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Summary',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: context.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Gap(AppSizes.spacingHeight16),
              const OrderDetailsWidget(
                order: '23',
                taxes: '34',
                deliveryFee: '45',
                total: '456',
              ),
              Gap(AppSizes.spacingHeight32),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: context.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Gap(AppSizes.spacingHeight16),
              PaymentMethodTile(
                title: 'Cash on Delivery',
                imagePath: 'assets/images/cash.png',
                value: "Cash",
                groupValue: selectedMethod,
                onChanged: (val) {
                  setState(() {
                    selectedMethod = val;
                  });
                },
              ),
              Gap(AppSizes.spacingHeight16),
              PaymentMethodTile(
                title: 'Visa / Mastercard',
                subtitle: '*** *** 1234',
                imagePath: 'assets/images/visa.png',
                value: "Visa",
                groupValue: selectedMethod,
                onChanged: (val) {
                  setState(() {
                    selectedMethod = val;
                  });
                },
              ),
              Gap(AppSizes.spacingHeight12),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.textWhite,
                    fillColor: WidgetStateProperty.all(
                      context.colorScheme.primary,
                    ),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: Text(
                      'Save card details for future payments',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.textSecondaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              Gap(AppSizes.spacingHeight120),
            ],
          ),
        ),
      ),
      bottomSheet: const CheckoutBottomBar(
        totalPrice: '\$ 456.00',
      ),
    );
  }
}
