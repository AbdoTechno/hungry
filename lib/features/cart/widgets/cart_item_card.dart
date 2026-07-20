import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/shared/custom_button.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final String image;
  final String title;
  final String subtitle;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingWidth16),
      height: AppSizes.spacingHeight185,
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
                : Colors.black.withValues(alpha: .08),
            blurRadius: AppSizes.spacingWidth10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Product Image & Title
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: AppSizes.spacingHeight8,
                      child: SizedBox(
                        width: AppSizes.spacingWidth110 * .85,
                        child: Container(
                          height: AppSizes.spacingHeight4,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .3),
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
                      height: AppSizes.spacingHeight90,
                      width: AppSizes.spacingWidth110,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Gap(AppSizes.spacingHeight4),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.textPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.textSecondaryColor,
                      ),
                ),
              ],
            ),
          ),
          Gap(AppSizes.spacingWidth12),
          // Right Controls & Remove Button
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CartCounterButton(
                      icon: Icons.remove,
                      onPressed: onRemove,
                    ),
                    Text(
                      quantity.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: context.textPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    _CartCounterButton(
                      icon: Icons.add,
                      onPressed: onAdd,
                    ),
                  ],
                ),
                Gap(AppSizes.spacingHeight12),
                CustomButton(
                  title: 'Remove',
                  onTap: () {},
                  width: double.infinity,
                  height: AppSizes.spacingHeight42,
                  fontSize: AppSizes.fontSize14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartCounterButton extends StatelessWidget {
  const _CartCounterButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSizes.spacingWidth16,
      backgroundColor: context.colorScheme.primary,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: AppSizes.iconSize16,
        ),
      ),
    );
  }
}
