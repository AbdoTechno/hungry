import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/features/cart/widgets/cart_bottom_bar.dart';
import 'package:hungry/features/cart/widgets/cart_item_card.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantity;
  final int itemCount = 10;

  @override
  void initState() {
    super.initState();
    quantity = List.generate(itemCount, (index) => 1);
  }

  void incrementQuantity(int index) {
    setState(() {
      quantity[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (quantity[index] > 1) {
        quantity[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppSizes.spacingWidth16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Gap(AppSizes.spacingHeight16),
              ),
              SliverList.separated(
                itemCount: itemCount,
                separatorBuilder: (context, index) =>
                    Gap(AppSizes.spacingHeight16),
                itemBuilder: (context, index) {
                  return CartItemCard(
                    image: 'assets/images/food2.png',
                    title: 'Hamburger',
                    subtitle: 'Veggie Burger',
                    quantity: quantity[index],
                    onAdd: () {
                      incrementQuantity(index);
                    },
                    onRemove: () {
                      decrementQuantity(index);
                    },
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Gap(AppSizes.spacingHeight60),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CartBottomBar(
          totalPrice: '\$12.00',
        ),
      ),
    );
  }
}
