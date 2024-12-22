import 'package:paynowuz/export.dart';
import 'package:flutter/material.dart';

class UploadImageWidget extends StatelessWidget {

  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final darkMode = Provider.of<ThemeProvider>(context);

    return Consumer<Users>(
      builder: (context, users, child) {
        return Column(
          children: [
            Container(
              height: 100.o,
              width: 100.o,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: darkMode.isDarkMode ? theme.disabledColor : Color.fromRGBO(243, 244, 245, 1),
                borderRadius: BorderRadius.circular(100.o),
              ),
              child: Container(
                height: 100.o,
                width: 100.o,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.o),
                ),
                child: users.image == null ? IconButton(onPressed: () {
                  users.pickImage();
                },
                  icon: const Icon(Icons.camera_alt_outlined),
                ) : Container(
                  height: 100.o,
                  width: 100.o,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.o)
                  ),
                  child: Image.file(
                    File(users.image!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            TextButton(onPressed: (){
              users.pickImage();
            }, child: Text(
              "upload_image".tr(),
              style: TextStyle(
                color: Color.fromRGBO(26, 135, 221, 1),
                fontSize: 14.o,
                fontWeight: FontWeight.w400,
              ),
            ),)
          ],
        );
      },
    );
  }
}
