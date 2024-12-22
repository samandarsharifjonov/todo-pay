
import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class SwitchDarkMode extends StatelessWidget {
  const SwitchDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return SwitchListTile(
          activeColor: Colors.white,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          activeTrackColor: Colors.green,
          title:  Text("dark_mode".tr(), key: ValueKey(context.locale.languageCode)),
          value: theme.isDarkMode,
          onChanged: (_) {
            theme.toggleTheme();
          },
        );
      },

    );
  }
}
