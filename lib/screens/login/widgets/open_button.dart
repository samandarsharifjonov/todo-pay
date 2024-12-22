
import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class OpenButton extends StatelessWidget {
  final String? text;
  final VoidCallback onSubmit;

  const OpenButton({
    super.key,
    required this.text,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 49.h,
        width: 315.w,
        decoration: BoxDecoration(
          color: text == null
              ? const Color.fromRGBO(217, 233, 246, 1)
              : Colors.blue,
        ),
        child: MaterialButton(
          onPressed: text != null ? onSubmit : null,
          child:  Text(
            "open".tr(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.o,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
