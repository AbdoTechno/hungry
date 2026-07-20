import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/features/cart/widgets/cart_item_card.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/shared/custom_button.dart';

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

        bottomNavigationBar: Container(
          width: double.infinity,
          height: AppSizes.spacingHeight180,
          padding: EdgeInsets.only(
            left: AppSizes.spacingWidth16,
            right: AppSizes.spacingWidth16,
            bottom: AppSizes.spacingHeight100,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSize20,
                        ),
                  ),

                  Gap(AppSizes.spacingHeight8),

                  Text(
                    '\$12.00',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSize24,
                        ),
                  ),
                ],
              ),

              const Spacer(),

              CustomButton(
                title: 'Checkout',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CheckoutView(),
                    ),
                  );
                },
                height: AppSizes.spacingHeight60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
