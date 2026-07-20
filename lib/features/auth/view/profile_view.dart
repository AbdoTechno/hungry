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
  final String userName = "AbdoTechno";
  final String userEmail = "abdo@gmail.com";
  final String userAddress = "55 Cairo, Egypt";
  final String passwordMasked = "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●";
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48),
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: AppColors.textPrimary,
                      size: 24,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Settings pressed')),
                      );
                    },
                  ),
                ],
              ),
              Gap(AppSizes.spacingHeight16),
              ProfileHeader(userName: userName),
              Gap(AppSizes.spacingHeight24),
              ProfileInfoCard(
                name: userName,
                email: userEmail,
                address: userAddress,
                password: passwordMasked,
              ),
              Gap(AppSizes.spacingHeight24),
              PaymentCard(
                cardType: cardType,
                cardNumber: cardNumber,
                cardName: "AbdoTechno",
                expiryDate: "12/25",
                image: "assets/images/visa.png",
              ),
              Gap(AppSizes.spacingHeight32),
              ActionButtons(
                onEdit: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profile pressed')),
                  );
                },
                onLogout: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
              Gap(AppSizes.spacingHeight100),
            ],
          ),
        ),
      ),
    );
  }
}
