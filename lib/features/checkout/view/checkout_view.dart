import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry/features/checkout/widgets/success_dialog.dart';
import 'package:hungry/shared/custom_button.dart';

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
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = "Cash";
                  });
                },
                contentPadding: EdgeInsets.all(
                  AppSizes.spacingWidth16,
                ),
                tileColor: context.tileBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadius16,
                  ),
                ),
                title: Text(
                  'Cash on Delivery',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                leading: Image.asset(
                  'assets/images/cash.png',
                  height: AppSizes.spacingHeight40,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.textWhite,
                  value: "Cash",
                  // ignore: deprecated_member_use
                  groupValue: selectedMethod,
                  // ignore: deprecated_member_use
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value!;
                    });
                  },
                ),
              ),
              Gap(AppSizes.spacingHeight16),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = "Visa";
                  });
                },
                contentPadding: EdgeInsets.all(
                  AppSizes.spacingWidth16,
                ),
                tileColor: context.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadius16,
                  ),
                ),
                title: Text(
                  'Visa / Mastercard',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text(
                  '*** *** 1234',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.textWhite.withValues(alpha: 0.8),
                      ),
                ),
                leading: Image.asset(
                  'assets/images/visa.png',
                  height: AppSizes.spacingHeight40,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.textWhite,
                  value: "Visa",
                  // ignore: deprecated_member_use
                  groupValue: selectedMethod,
                  // ignore: deprecated_member_use
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value!;
                    });
                  },
                ),
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
      bottomSheet: Container(
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
                  '\$ 456.00',
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
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const SuccessDialog();
                  },
                );
              },
              height: AppSizes.spacingHeight60,
            ),
          ],
        ),
      ),
    );
  }
}
