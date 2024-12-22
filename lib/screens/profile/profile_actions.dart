import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paynowuz/helpers/app_size.dart';
import 'package:paynowuz/screens/profile/widgets/selected_lang_button.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../provider/users_provider.dart';
import '../onboarding/onboarding.dart';


void forLogOut(BuildContext context)async{
  Provider.of<Users>(context, listen: false).clearSharedPreferences(context);
  await Provider.of<ThemeProvider>(context, listen: false).themeOff();
  Navigator.pushNamedAndRemoveUntil(context, Onboarding.routName, (route) => false,);
  if(context.locale == const Locale('uz') || context.locale == const Locale('ru')){
    context.setLocale(const Locale('en'));
  }

}



void selectLanguage(BuildContext context) {
  final theme = Theme.of(context);
  showModalBottomSheet(
    isDismissible: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "language_selection".tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            const Divider(),
            Column(
              children: [
                SizedBox(height: 20.h),
                SelectedLangButton(
                  onPressed: () {
                    if (context.locale == const Locale('en') ||
                        context.locale == const Locale('ru')) {
                      context.setLocale(const Locale('uz'));
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                  },
                  buttonTitle: "uzbek_language".tr(),
                  color: Colors.blueAccent,
                ),
                 SizedBox(height: 20.h),
                SelectedLangButton(
                  onPressed: (){
                    if (context.locale == const Locale('uz') || context.locale == const Locale('ru')) {
                      context.setLocale(const Locale('en'));
                      Navigator.of(context, rootNavigator: true).pop();
                      //Navigator.of(context).pop();
                    }
                  },
                  buttonTitle: "english_language".tr(),
                  color: Colors.blueAccent,
                ),
                 SizedBox(height: 20.h),
                SelectedLangButton(
                  onPressed: () {
                    if (context.locale == const Locale('uz') || context.locale == const Locale('en')) {
                      context.setLocale(const Locale('ru'));
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                  },
                  buttonTitle: "russian_language".tr(),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}



void logOut(BuildContext context) {
  final theme = Theme.of(context);
  showModalBottomSheet(
    isDismissible: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "log_out".tr(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(height: 10.h),
            const Divider(),
            Column(
              children: [
                SizedBox(height: 20.h),
                SelectedLangButton(
                  onPressed: () {
                    forLogOut(context);
                  },
                  color: Colors.red,
                  buttonTitle: "log_out".tr(),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}