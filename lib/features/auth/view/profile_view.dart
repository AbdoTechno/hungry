import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_colors.dart';
import 'package:hungry/features/auth/widgets/action_buttons.dart';
import 'package:hungry/features/auth/widgets/payment_card.dart';
import 'package:hungry/features/auth/widgets/profile_header.dart';
import 'package:hungry/features/auth/widgets/profile_info_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String userName = "Knuckles";
  final String userEmail = "Knuckles@gmail.com";
  final String userAddress = "55 Dubai, UAE";
  final String passwordMasked =
      "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●";
  final String cardType = "VISA";
  final String cardNumber = "3566 **** **** 0505";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacingWidth20,
            vertical: AppSizes.spacingHeight16,
          ),
          child: Column(
            children: [
              // 1. الهيدر (الصورة + الاسم)
              ProfileHeader(userName: userName),
              Gap(AppSizes.spacingHeight24),

              // 2. بطاقة المعلومات الشخصية
              ProfileInfoCard(
                name: userName,
                email: userEmail,
                address: userAddress,
                password: passwordMasked,
              ),
              Gap(AppSizes.spacingHeight24),

              // 3. بطاقة الدفع
              PaymentCard(
                cardType: cardType,
                cardNumber: cardNumber,
              ),
              Gap(AppSizes.spacingHeight32),

              // 4. أزرار الإجراءات
              ActionButtons(
                onEdit: () {
                  // TODO: التنقل لصفحة تعديل الملف الشخصي
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text('Edit Profile pressed'),
                    ),
                  );
                },
                onLogout: () {
                  // TODO: تنفيذ تسجيل الخروج
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                  );
                },
              ),
              Gap(AppSizes.spacingHeight20),
            ],
          ),
        ),
      ),
    );
  }
}
