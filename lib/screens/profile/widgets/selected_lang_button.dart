import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class SelectedLangButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;
  final Color color;
  const SelectedLangButton({super.key, required this.onPressed, required this.buttonTitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.o),
      child: Container(
        height: 49.h,
        width: 345.w,
        decoration: BoxDecoration(
            color: color,
        ),
        child: MaterialButton(onPressed: onPressed, child: Text(buttonTitle, style: TextStyle(
          color: Colors.white
        ),),),
      ),
    );
  }
}
