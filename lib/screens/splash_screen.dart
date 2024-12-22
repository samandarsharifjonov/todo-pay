import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
        if (mounted) {
          Navigator.popAndPushNamed(context, Onboarding.routName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xFF121212)
          : const Color.fromRGBO(26, 135, 221, 1),
      body: Center(
        child: SvgPicture.asset(
          Assets.iconsPayNowLogo,
          width: 106,
          height: 137,
        ),
      ),
    );
  }
}
