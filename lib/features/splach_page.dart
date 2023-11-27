import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/config/app_routes.dart';
import 'package:spotify_app/core/utils/app_images.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName = '/splach';
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(Routes.homeLayout);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      body: Center(
          child: Container(
        width: 200.w,
        height: 200.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.logo),
            fit: BoxFit.fill,
          ),
        ),
      )),
    );
  }
}
