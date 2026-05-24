import 'package:flutter/material.dart';

import 'features/food/view/food_list_page.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Hungry', home: FoodListPage());
  }
}
