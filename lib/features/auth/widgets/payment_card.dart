import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    this.image,
  });

  final String cardType;
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final String formattedCardNumber = cardNumber.replaceAll('*', '•');

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, AppSizes.spacingHeight20 * (1 - opacity)),
            child: child,
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 1.586,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryGradientEnd, AppColors.cardGradientEnd],
            ),
            borderRadius: BorderRadius.circular(AppSizes.borderRadius20),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardGradientEnd.withValues(alpha: 0.4),
                blurRadius: AppSizes.spacingWidth20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -AppSizes.spacingWidth50,
                top: -AppSizes.spacingHeight50,
                child: Container(
                  width: AppSizes.spacingWidth180,
                  height: AppSizes.spacingHeight180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textWhite.withValues(alpha: 0.04),
                  ),
                ),
              ),
              Positioned(
                left: -AppSizes.spacingWidth32,
                bottom: -AppSizes.spacingHeight30,
                child: Container(
                  width: AppSizes.spacingWidth140,
                  height: AppSizes.spacingHeight140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textWhite.withValues(alpha: 0.03),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSizes.spacingWidth24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          image ?? 'assets/images/visa.png',
                          height: AppSizes.spacingHeight30,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Text(
                              'VISA',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: AppSizes.fontSize18,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.spacingWidth10,
                            vertical: AppSizes.spacingHeight4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textWhite.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadius8,
                            ),
                            border: Border.all(
                              color: AppColors.textWhite.withValues(alpha: 0.1),
                              width: 0.8,
                            ),
                          ),
                          child: Text(
                            cardType.toString(),
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: AppSizes.fontSize10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Gold Sim Card Chip
                    Container(
                      width: AppSizes.spacingWidth40,
                      height: AppSizes.spacingHeight32,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.gold,
                            AppColors.goldSecondary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius6,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: AppSizes.spacingWidth4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GridView.count(
                              crossAxisCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(4),
                              children: List.generate(
                                6,
                                (index) => Container(
                                  margin: const EdgeInsets.all(0.5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 0.4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Card Number
                    Text(
                      formattedCardNumber,
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: AppSizes.fontSize22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.5,
                      ),
                    ),

                    // Bottom Row: Holder Name & Expiry
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CARD HOLDER',
                              style: TextStyle(
                                color: AppColors.textWhite.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: AppSizes.fontSize9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.8,
                              ),
                            ),
                            Gap(AppSizes.spacingHeight4),
                            Text(
                              cardName,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: AppSizes.fontSize14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EXPIRES',
                              style: TextStyle(
                                color: AppColors.textWhite.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: AppSizes.fontSize9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.8,
                              ),
                            ),
                            Gap(AppSizes.spacingHeight4),
                            Text(
                              expiryDate,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: AppSizes.fontSize14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
