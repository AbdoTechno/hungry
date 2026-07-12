import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/widgets/custom_text_form_field.dart';
import 'package:hungry/features/home/view/home_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

            // 4. Scrollable Form Content
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingWidth20,
                  ),
                  child: Column(
                    children: [
                      Gap(AppSizes.spacingHeight60),

                      // Logo
                      SvgPicture.asset(
                        'assets/images/hungry.svg',
                        width: AppSizes.spacingWidth250,
                        height: AppSizes.spacingHeight60,
                      ),

                      Gap(AppSizes.spacingHeight24),

                      // Title
                      Text(
                        'Join Us!',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'LuckiestGuy-Regular',
                          color: AppColors.textWhite,
                          fontSize: AppSizes.fontSize24 * 1.2,
                          letterSpacing: 1.2,
                        ),
                      ),

                      Gap(AppSizes.spacingHeight8),

                      // Subtitle
                      Text(
                        'Create an account to start your food journey',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textWhite.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      Gap(AppSizes.spacingHeight30),

                      // Sign Up Card
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
                              color: Colors.black.withValues(alpha: 0.12),
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
                                "Create your account",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontFamily: 'LuckiestGuy-Regular',
                                  color: AppColors.textPrimary,
                                  fontSize: AppSizes.fontSize20,
                                ),
                              ),

                              Gap(AppSizes.spacingHeight24),

                              // Name Field
                              CustomTextFormField(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                controller: _nameController,
                                hintText: 'Full Name',
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight16),

                              // Phone Field
                              CustomTextFormField(
                                validator: Validators.validatePhone,
                                controller: _phoneController,
                                hintText: 'Phone Number',
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight16),

                              // Email Field
                              CustomTextFormField(
                                validator: Validators.validateEmail,
                                controller: _emailController,
                                hintText: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight16),

                              // Password Field
                              CustomTextFormField(
                                validator: Validators.validatePassword,
                                controller: _passwordController,
                                hintText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight16),

                              // Confirm Password Field
                              CustomTextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                controller: _confirmPasswordController,
                                hintText: 'Confirm Password',
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight24),

                              // Sign Up Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const HomeView(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Sign Up'),
                                ),
                              ),

                              Gap(AppSizes.spacingHeight20),

                              // Login Navigation Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.spacingWidth8,
                                      ),
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'Login',
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
