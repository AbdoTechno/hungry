import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/widgets/auth_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required VoidCallback onSignUp,
    required VoidCallback onLogin,
    required String avatarController,
    required VoidCallback pickAvatar,
    void Function(String)? onNameChanged,
  }) : _pickAvatar = pickAvatar,
       _formKey = formKey,
       _nameController = nameController,
       _emailController = emailController,
       _passwordController = passwordController,
       _onSignUp = onSignUp,
       _onLogin = onLogin,
       _avatarController = avatarController,
       _onNameChanged = onNameChanged;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final VoidCallback _onSignUp;
  final VoidCallback _onLogin;
  final VoidCallback _pickAvatar;
  final String _avatarController;
  final void Function(String)? _onNameChanged;

  @override
  Widget build(BuildContext context) {
    const bool isLogin = false;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - opacity)),
            child: child,
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthField(
              isLogin: isLogin,
              controller: _nameController,
              hintText: 'Name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onChanged: _onNameChanged,
            ),
            Gap(AppSizes.spacingHeight16),
            AuthField(
              isLogin: isLogin,
              controller: _emailController,
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validators.validateEmail,
            ),
            Gap(AppSizes.spacingHeight16),
            AuthField(
              isLogin: isLogin,
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: Validators.validatePassword,
            ),
            Gap(AppSizes.spacingHeight16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _pickAvatar,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Pick an avatar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(AppSizes.spacingHeight24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(AppSizes.spacingHeight16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Go To Login ?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
