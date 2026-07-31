import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/network/api_errors.dart';
import 'package:hungry/core/network/dio_api_service.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/widgets/auth_header.dart';
import 'package:hungry/features/auth/widgets/signup_form.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/root.dart';
import 'package:image_codec/image_codec.dart';
import 'package:image_picker/image_picker.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late String _avatarController;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();
  AuthRepo authRepo = AuthRepo(apiService: DioApiService());

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _avatarController = '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  final ImagePicker picker = ImagePicker();

  bool isLoading = false;

  Future<String> pickAvatar() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final file = File(image.path);

      final codedImage = await ImageCodec.encode(file);

      // Store the picked image data in the name controller (for testing)
      setState(() {
        _nameController.text = codedImage.data;
      });

      return codedImage.data;
    }

    return '';
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        isLoading = true;
        await authRepo.signup(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _avatarController,
        );
        isLoading = false;
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Root(),
          ),
        );
      } on ApiErrors catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Gap(AppSizes.spacingHeight80),
                        TweenAnimationBuilder<double>(
                          tween: Tween(
                            begin: 0.0,
                            end: 1.0,
                          ),
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeOutBack,
                          builder: (context, val, child) {
                            return Opacity(
                              opacity: val.clamp(0.0, 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  0,
                                  -30 * (1 - val),
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: const AuthHeader(
                            isLogin: false,
                            subtitle:
                                'Welcome to our Food App',
                          ),
                        ),
                        Gap(AppSizes.spacingHeight24),
                        Expanded(
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(
                              begin: 0.0,
                              end: 1.0,
                            ),
                            duration: const Duration(
                              milliseconds: 800,
                            ),
                            curve: Curves.fastOutSlowIn,
                            builder: (context, val, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  120 * (1 - val),
                                ),
                                child: child,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.vertical(
                                      top: Radius.circular(
                                        32,
                                      ),
                                    ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.spacingWidth24,
                                vertical: AppSizes
                                    .spacingHeight32,
                              ),
                              child: SignupForm(
                                formKey: _formKey,
                                nameController:
                                    _nameController,
                                emailController:
                                    _emailController,
                                passwordController:
                                    _passwordController,
                                onSignUp: _handleSignUp,
                                onLogin: _handleLogin,
                                avatarController:
                                    _avatarController,
                                pickAvatar: () {
                                  pickAvatar();
                                },
                                onNameChanged: (val) {
                                  setState(() {
                                    final trimmed = val
                                        .trim();
                                    _avatarController =
                                        trimmed.isEmpty
                                        ? ''
                                        : 'https://i.imgur.com/$trimmed';
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
