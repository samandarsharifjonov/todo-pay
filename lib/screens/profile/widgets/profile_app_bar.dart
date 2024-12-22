import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(
        "profile".tr(),
        style: TextStyle(fontSize: 20.o, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}