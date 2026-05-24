import 'package:flutter/material.dart';

import '../widgets/food_card.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food List')),
      body: const Center(child: Text('Food list page placeholder')),
    );
  }
}
