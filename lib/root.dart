import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistory/views/order_history.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late final PageController _pageController;

  final List<Widget> screens = [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': CupertinoIcons.home,
      'activeIcon': CupertinoIcons.house_fill,
      'label': 'Home',
    },
    {
      'icon': CupertinoIcons.bag,
      'activeIcon': CupertinoIcons.bag_fill,
      'label': 'Cart',
    },
    {
      'icon': Icons.restaurant,
      'activeIcon': Icons.restaurant,
      'label': 'History',
    },
    {
      'icon': CupertinoIcons.person,
      'activeIcon': CupertinoIcons.person_fill,
      'label': 'Profile',
    },
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() => _currentIndex = value);
        },
        children: screens,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: AppSizes.spacingWidth20,
        right: AppSizes.spacingWidth20,
        bottom: AppSizes.spacingHeight24,
      ),
      child: Container(
        height: 75.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryDark, AppColors.primary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(40),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final isSelected = _currentIndex == index;
              final item = _navItems[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    horizontal: isSelected ? 16.w : 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withAlpha(
                            45,
                          ) // Translucent white glassmorphic capsule
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadius20,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? item['activeIcon'] : item['icon'],
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withAlpha(
                                140,
                              ), // Elegant soft white unselected state
                        size: AppSizes.iconSize24,
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 8.w),
                        Text(
                          item['label'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontSize14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
