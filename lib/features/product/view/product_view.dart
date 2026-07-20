import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/product/widgets/product_bottom_bar.dart';
import 'package:hungry/features/product/widgets/product_info_card.dart';
import 'package:hungry/features/product/widgets/product_options_list.dart';
import 'package:hungry/features/product/widgets/product_section_header.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double spicyValue = 0.5;
  int quantity = 1;
  bool isFavorite = false;
  final double basePrice = 12.00;

  final Set<String> selectedToppings = {'t1'};
  final Set<String> selectedSides = {};

  final List<ProductOptionItem> toppingsList = const [
    ProductOptionItem(
      id: 't1',
      title: 'Tomato',
      image: 'assets/images/tomato.png',
      price: 0.80,
    ),
    ProductOptionItem(
      id: 't2',
      title: 'Onion',
      image: 'assets/images/onion.png',
      price: 0.50,
    ),
    ProductOptionItem(
      id: 't3',
      title: 'Pickles',
      image: 'assets/images/tomato.png',
      price: 0.75,
    ),
    ProductOptionItem(
      id: 't4',
      title: 'Cheese',
      image: 'assets/images/food2.png',
      price: 1.50,
    ),
  ];

  final List<ProductOptionItem> sideOptionsList = const [
    ProductOptionItem(
      id: 's1',
      title: 'Onion Rings',
      image: 'assets/images/onion.png',
      price: 2.50,
    ),
    ProductOptionItem(
      id: 's2',
      title: 'Fries',
      image: 'assets/images/food2.png',
      price: 3.00,
    ),
    ProductOptionItem(
      id: 's3',
      title: 'Coleslaw',
      image: 'assets/images/food1.png',
      price: 2.20,
    ),
  ];

  double get calculateTotalPrice {
    double toppingsPrice = toppingsList
        .where((item) => selectedToppings.contains(item.id))
        .fold(0.0, (sum, item) => sum + item.price);

    double sidesPrice = sideOptionsList
        .where((item) => selectedSides.contains(item.id))
        .fold(0.0, (sum, item) => sum + item.price);

    return (basePrice + toppingsPrice + sidesPrice) * quantity;
  }

  void _toggleTopping(String id) {
    setState(() {
      selectedToppings.contains(id)
          ? selectedToppings.remove(id)
          : selectedToppings.add(id);
    });
  }

  void _toggleSide(String id) {
    setState(() {
      selectedSides.contains(id)
          ? selectedSides.remove(id)
          : selectedSides.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = calculateTotalPrice;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: AppSizes.iconSize20,
          ),
        ),
        title: Text(
          'Product Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.fontSize18,
                color: AppColors.textPrimary,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() => isFavorite = !isFavorite),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppColors.error : AppColors.textPrimary,
              size: AppSizes.iconSize24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacingWidth16,
            vertical: AppSizes.spacingHeight12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: spicyValue,
                onChanged: (val) => setState(() => spicyValue = val),
              ),
              Gap(AppSizes.spacingHeight24),
              ProductInfoCard(
                title: 'Cheeseburger Deluxe',
                subtitle: 'Base price: \$${basePrice.toStringAsFixed(2)}',
                quantity: quantity,
                onIncrement: () => setState(() => quantity++),
                onDecrement: () => setState(() => quantity--),
              ),
              Gap(AppSizes.spacingHeight24),
              ProductSectionHeader(
                title: 'Toppings',
                selectedCount: selectedToppings.length,
                badgeColor: AppColors.primary,
              ),
              Gap(AppSizes.spacingHeight12),
              ProductOptionsList(
                items: toppingsList,
                selectedIds: selectedToppings,
                onToggle: _toggleTopping,
              ),
              Gap(AppSizes.spacingHeight24),
              ProductSectionHeader(
                title: 'Side Options',
                selectedCount: selectedSides.length,
                badgeColor: AppColors.primaryLight,
              ),
              Gap(AppSizes.spacingHeight12),
              ProductOptionsList(
                items: sideOptionsList,
                selectedIds: selectedSides,
                onToggle: _toggleSide,
                buttonColor: AppColors.primaryLight,
              ),
              Gap(AppSizes.spacingHeight24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductBottomBar(
        totalPrice: totalPrice,
        onAddToCart: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added to cart! Total: \$${totalPrice.toStringAsFixed(2)}',
              ),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
              ),
            ),
          );
        },
      ),
    );
  }
}
