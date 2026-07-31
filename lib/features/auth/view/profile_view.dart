import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widgets/action_buttons.dart';
import 'package:hungry/features/auth/widgets/payment_card.dart';
import 'package:hungry/features/auth/widgets/profile_header.dart';
import 'package:hungry/features/auth/widgets/profile_info_card.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/core/network/dio_api_service.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:image_codec/image_codec.dart';
import 'dart:typed_data';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = "";
  String userEmail = "";
  String userAddress = "";
  String passwordMasked =
      "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●";
  final String cardType = "VISA";
  final String cardNumber = "3566 **** **** 0505";

  final AuthRepo authRepo = AuthRepo(
    apiService: DioApiService(),
  );
  Uint8List? _avatarBytes;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final UserModel user = await authRepo
          .getUserProfile();

      // server returns encoded image in `name` field
      final String serverImageString = user.name;
      Uint8List? decodedBytes;
      if (serverImageString.isNotEmpty) {
        decodedBytes = await ImageCodec.decode(
          serverImageString,
        );
      }

      // avatar field contains 'https://i.imgur.com/<name>' — strip prefix to get original name
      String displayName = '';
      if (user.avatar != null && user.avatar.isNotEmpty) {
        const prefix = 'https://i.imgur.com/';
        if (user.avatar.startsWith(prefix)) {
          displayName = user.avatar.substring(
            prefix.length,
          );
        } else {
          displayName = user.avatar;
        }
      }

      setState(() {
        userName = displayName;
        userEmail = user.email;
        userAddress = user
            .role; // if role used as address placeholder
        _avatarBytes = decodedBytes;
      });
    } catch (e) {
      // ignore and keep defaults
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
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
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: AppSizes.spacingWidth40),
                  Text(
                    'Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.textPrimaryColor,
                          fontSize: AppSizes.fontSize20,
                        ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_sharp,
                      color: context.textPrimaryColor,
                      size: AppSizes.iconSize24,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text('Settings pressed'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Gap(AppSizes.spacingHeight16),
              ProfileHeader(
                userName: userName,
                avatarBytes: _avatarBytes,
              ),
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
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text('Edit Profile pressed'),
                    ),
                  );
                },
                onLogout: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LoginView(),
                    ),
                  );
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
