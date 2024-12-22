import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Users>(
      builder: (context, value, child) {
        return TextButton(
          onPressed: () {
            value.pickImage();
          },
          child:  Text(
            "upload_image".tr(),
            style: TextStyle(
              color: Color.fromRGBO(26, 135, 221, 1),
              fontSize: 14.o,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },

    );
  }
}
