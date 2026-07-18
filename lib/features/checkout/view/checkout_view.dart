import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
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
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(AppSizes.spacingWidth16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Summary',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge,
              ),
              Gap(AppSizes.spacingHeight16),
              OrderDetailsWidget(
                order: '23',
                taxes: '34',
                deliveryFee: '45',
                total: '456',
              ),
              Gap(AppSizes.spacingHeight80),
              Text(
                'Payment Method',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge,
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
                tileColor: AppColors.tileColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadius16,
                  ),
                ),
                title: Text(
                  'Cash on Delivery',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        color: AppColors.textWhite,
                      ),
                ),
                leading: Image.asset(
                  'assets/images/cash.png',
                  height: AppSizes.spacingHeight40,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.background,
                  value: "Cash",
                  groupValue: selectedMethod,
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
                tileColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadius16,
                  ),
                ),
                title: Text(
                  'Cash on Delivery',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        color: AppColors.textWhite,
                      ),
                ),
                subtitle: Text(
                  '*** *** 1234',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        color: AppColors.textWhite,
                      ),
                ),
                leading: Image.asset(
                  'assets/images/visa.png',
                  height: AppSizes.spacingHeight40,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.background,
                  value: "Visa",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value!;
                    });
                  },
                ),
              ),
              Gap(AppSizes.spacingHeight8),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.textWhite,
                    fillColor: MaterialStateProperty.all(
                      AppColors.error,
                    ),

                    activeColor: AppColors.error,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Save card details for future payments',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: AppSizes.spacingHeight120,
        padding: EdgeInsets.all(AppSizes.spacingWidth16),
        decoration: BoxDecoration(
          color: AppColors.buttonSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              AppSizes.borderRadius24,
            ),
            topRight: Radius.circular(
              AppSizes.borderRadius16,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 10,
              offset: const Offset(0, 10),
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
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge,
                ),
                Gap(AppSizes.spacingHeight8),
                Text(
                  '\$ 456.00',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge,
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              title: "Pay Now",
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return SuccessDialog();
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
