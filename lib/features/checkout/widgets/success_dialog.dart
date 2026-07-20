import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingWidth24,
          vertical: AppSizes.spacingHeight32,
        ),
        decoration: BoxDecoration(
          color: context.cardBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius24),
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/success.png',
              width: AppSizes.spacingWidth100,
              height: AppSizes.spacingHeight100,
            ),
            SizedBox(height: AppSizes.spacingHeight24),
            Text(
              "Success !",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
            ),
            SizedBox(height: AppSizes.spacingHeight16),
            Text(
              "Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.textSecondaryColor,
                    height: 1.6,
                  ),
            ),
            SizedBox(height: AppSizes.spacingHeight32),
            SizedBox(
              width: double.infinity,
              height: AppSizes.spacingHeight52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadius16,
                    ),
                  ),
                ),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    fontSize: AppSizes.fontSize18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
