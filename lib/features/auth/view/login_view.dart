import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/widgets/custom_text_form_field.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/auth/view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            // 1. Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryDark, AppColors.primary],
                ),
              ),
            ),

            // 2. Decorative Top-Right Food Element
            Positioned(
              top: -AppSizes.spacingHeight40,
              right: -AppSizes.spacingWidth32,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/food1.png',
                  width: AppSizes.spacingWidth280,
                ),
              ),
            ),

            // 3. Decorative Bottom-Left Food Element
            Positioned(
              bottom: -AppSizes.spacingHeight40,
              left: -AppSizes.spacingWidth32,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/food2.png',
                  width: AppSizes.spacingWidth280,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 3. Scrollable Form Content
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingWidth20,
                  ),
                  child: Column(
                    children: [
                      Gap(AppSizes.spacingHeight120),

                      // Logo
                      SvgPicture.asset(
                        'assets/images/hungry.svg',
                        width: AppSizes.spacingWidth250,
                        height: AppSizes.spacingHeight60,
                      ),

                      Gap(AppSizes.spacingHeight24),

                      // Title
                      Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontFamily: 'LuckiestGuy-Regular',
                              color: AppColors.textWhite,
                              fontSize: AppSizes.fontSize24 * 1.2,
                              letterSpacing: 1.2,
                            ),
                      ),

                      Gap(AppSizes.spacingHeight8),

                      // Subtitle
                      Text(
                        'Login to continue your food journey',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textWhite.withOpacity(0.85),
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      Gap(AppSizes.spacingHeight45),

                      // Login Card
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spacingWidth24,
                          vertical: AppSizes.spacingHeight32,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(
                            AppSizes.borderRadius24,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Headings with fixed dark-text contrast
                              Text(
                                "Let's get you back on track!",
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontFamily: 'LuckiestGuy-Regular',
                                      color: AppColors.textPrimary,
                                      fontSize: AppSizes.fontSize20,
                                    ),
                              ),

                              Gap(AppSizes.spacingHeight24),

                              // Email field
                              CustomTextFormField(
                                validator: Validators.validateEmail,
                                controller: _emailController,
                                hintText: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,

                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primary.withOpacity(0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight16),

                              // Password field with Toggle
                              CustomTextFormField(
                                validator: Validators.validatePassword,
                                controller: _passwordController,
                                hintText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primary.withOpacity(0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight12),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight24),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeView(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Login'),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight20),

                              // Sign up row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignupView(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.spacingWidth8,
                                      ),
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(AppSizes.spacingHeight30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
