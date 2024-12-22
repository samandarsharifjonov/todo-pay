import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class OnboardingPage extends StatelessWidget {
  final String svgPicture;
  final String title;

  const OnboardingPage({
    super.key,
    required this.svgPicture,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: 140.h),
        SizedBox(
          height: 280.h,
          width: double.infinity,
          child: SvgPicture.asset(svgPicture),
        ),
        SizedBox(height: 64.h),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.o,
            color: theme.textTheme.bodyLarge!.color,
          ),
        ),
        SizedBox(height: 125.h),
      ],
    );
  }
}
