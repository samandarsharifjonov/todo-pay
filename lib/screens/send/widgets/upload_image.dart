import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';


class SendUploadImageWidget extends StatelessWidget {
  const SendUploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final darkMode = Provider.of<ThemeProvider>(context);

    return Consumer<ImageSendProvider>(
      builder: (context, imageProvider, child) {
        return Column(
          children: [
            Container(
              height: 100.o,
              width: 100.o,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: darkMode.isDarkMode ? theme.disabledColor : Color.fromRGBO(243, 244, 245, 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: imageProvider.image == null
                  ? Icon(Icons.person, size: 25.o,)
                  : Image.file(
                  File(imageProvider.image ?? ""),
                  fit: BoxFit.fill,
                                      ),
            ),
            SizedBox(
              height: 5.h,
            ),
            TextButton(
              onPressed: () {
                imageProvider.pickImage();
              },
              child: Text(
                "upload_image".tr(),
                style: TextStyle(
                  color: Color.fromRGBO(26, 135, 221, 1),
                  fontSize: 14.o,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
