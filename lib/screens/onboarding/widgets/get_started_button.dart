import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 49.h,
        width: 315.w,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child:  Text(
            "get_started".tr(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.o,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
