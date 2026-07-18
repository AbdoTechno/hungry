import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
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

  // onAdd
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingWidth16),
      height: AppSizes.spacingHeight180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
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
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 12,
                    child: SizedBox(
                      width: AppSizes.spacingWidth110 * .85,
                      child: Container(
                        height: AppSizes.spacingHeight4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(alpha: .7),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    image,
                    height: AppSizes.spacingHeight100,
                    width: AppSizes.spacingWidth110,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: AppColors.textPrimary,
                    ),
              ),

              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),

          Gap(AppSizes.spacingWidth80),

          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    _CounterButton(
                      icon: Icons.remove,
                      onPressed: onRemove,
                    ),
                    Text(
                      quantity.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium,
                    ),
                    _CounterButton(
                      icon: Icons.add,
                      onPressed: onAdd,
                    ),
                  ],
                ),

                Gap(AppSizes.spacingHeight40),

                CustomButton(
                  title: 'Remove',
                  onTap: () {},
                  // height: AppSizes.spacingHeight40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.buttonPrimary,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.background),
      ),
    );
  }
}
