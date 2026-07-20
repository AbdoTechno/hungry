import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/features/orderHistory/widgets/order_history_card.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.spacingWidth16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: Gap(AppSizes.spacingHeight16)),
              SliverList.separated(
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    Gap(AppSizes.spacingHeight16),
                itemBuilder: (context, index) {
                  return const OrderHistoryCard(
                    image: 'assets/images/food2.png',
                    title: 'Hamburger',
                    quantity: 1,
                    price: '12.99',
                  );
                },
              ),
              SliverToBoxAdapter(child: Gap(AppSizes.spacingHeight60)),
            ],
          ),
        ),
      ),
    );
  }
}
