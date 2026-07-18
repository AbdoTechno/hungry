import 'package:flutter/material.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistory/views/order_history.dart';
import 'package:hungry/floating_bottom_bar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // IndexedStack – يحتفظ بجميع الصفحات ويعرض واحدة فقط
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          // Bottom Bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: FloatingBottomBar(
              currentIndex: _currentIndex,
              onTap: _changePage,
            ),
          ),
        ],
      ),
    );
  }
}