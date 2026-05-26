import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _navigate(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Center(
        child: Column(
          children: [
            Gap(AppSizes.spacingHeight350),
            SvgPicture.asset(
              'assets/images/hungry.svg',
              width: AppSizes.spacingWidth250,
              height: AppSizes.spacingHeight60,
            ),
            Spacer(),
            Image.asset(
              'assets/images/burger.png',
              width: AppSizes.spacingWidth438,
              height: AppSizes.spacingHeight290,
            ),
          ],
        ),
      ),
    );
  }
}

void _navigate(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) =>  Root()),
  );
}
