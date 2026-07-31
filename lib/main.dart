import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/theme/app_theme.dart';
import 'package:hungry/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  try {
    final data = await rootBundle.load(
      'assets/images/me.jpg',
    );
    final bytes = data.buffer.asUint8List();
    final base64String = base64Encode(bytes);
    log('Encoded image: ==>$base64String <==');
  } catch (error, stackTrace) {
    log(
      'Failed to load asset image: $error',
      stackTrace: stackTrace,
    );
  }

  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: 'Hungry',
          home: const SplashScreen(),
        );
      },
    );
  }
}




