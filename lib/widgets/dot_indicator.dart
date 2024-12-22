import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class DotIndicator extends StatelessWidget {
  int dotIndex;
   DotIndicator({super.key, required this.dotIndex});

  Widget dotIndicator({required Color color}) {
    return Container(
      height: 5.h,
      width: 15.w,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        dotIndicator(
            color: dotIndex == 0 ? Colors.blue : Colors.grey),
        SizedBox(
          width: 8.w,
        ),
        dotIndicator(
            color: dotIndex == 1 ? Colors.blue : Colors.grey),
        SizedBox(
          width: 8.w,
        ),
        dotIndicator(
            color: dotIndex == 2 ? Colors.blue : Colors.grey),
      ],
    );
  }
}
