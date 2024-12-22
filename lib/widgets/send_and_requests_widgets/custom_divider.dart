import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      color: const Color.fromRGBO(244, 245, 246, 1),
    );
  }
}
