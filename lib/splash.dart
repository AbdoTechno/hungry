import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/features/auth/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _burgerFade;
  late final Animation<Offset> _burgerSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Logo: fade + scale, 0s – 0.6s
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.6,
          curve: Curves.easeOut,
        ),
      ),
    );
    _logoScale = Tween<double>(begin: 0.8, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.0,
              0.6,
              curve: Curves.easeOut,
            ),
          ),
        );

    // Burger: fade + slide up, 0.3s – 1.0s
    _burgerFade = Tween<double>(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.3,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        );
    _burgerSlide =
        Tween<Offset>(
          begin: const Offset(
            0.0,
            0.1,
          ), // 10% of screen height down
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.3,
              1.0,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    _controller.forward();

    // Navigate after 2 seconds (matches animation duration)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _navigate(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Column(
              children: [
                Gap(AppSizes.spacingHeight350),

                // Logo with fade + scale
                FadeTransition(
                  opacity: _logoFade,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: SvgPicture.asset(
                      'assets/images/hungry.svg',
                      width: AppSizes.spacingWidth250,
                      height: AppSizes.spacingHeight60,
                    ),
                  ),
                ),

                const Spacer(),

                // Burger with fade + slide-up
                FadeTransition(
                  opacity: _burgerFade,
                  child: SlideTransition(
                    position: _burgerSlide,
                    child: Image.asset(
                      'assets/images/burger.png',
                      width: AppSizes.spacingWidth438,
                      height: AppSizes.spacingHeight290,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
