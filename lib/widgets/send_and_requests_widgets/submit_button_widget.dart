import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const SubmitButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 49.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
               SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.o,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





