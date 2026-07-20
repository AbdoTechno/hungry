import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/product/widgets/toppings_card.dart';

class ProductOptionItem {
  final String id;
  final String title;
  final String image;
  final double price;

  const ProductOptionItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
}

class ProductOptionsList extends StatelessWidget {
  final List<ProductOptionItem> items;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;
  final Color buttonColor;
  final double height;

  const ProductOptionsList({
    super.key,
    required this.items,
    required this.selectedIds,
    required this.onToggle,
    this.buttonColor = AppColors.primary,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, _) => Gap(AppSizes.spacingWidth12),
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedIds.contains(item.id);
          return ToppingsCard(
            image: item.image,
            title: item.title,
            price: '+\$${item.price.toStringAsFixed(2)}',
            isSelected: isSelected,
            buttonColor: buttonColor,
            onTap: () => onToggle(item.id),
          );
        },
      ),
    );
  }
}
