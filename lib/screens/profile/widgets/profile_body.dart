import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';
import '../profile_actions.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 9.h,
        ),
        const UploadImageWidget(),
        SizedBox(
          height: 20.h,
        ),
        const SwitchDarkMode(),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            selectLanguage(context);
          },
          child: Container(
            height: 50.h,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 10.h,
                ),
                const Icon(Icons.language),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  "language_selection".tr(),
                  style: TextStyle(fontSize: 17.o),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            logOut(context);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "log_out".tr(),
                  style: TextStyle(fontSize: 17.o, color: Colors.red),
                )
              ],
            ),
          ),
        )
      ],
    );

  }
}
