import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class SnackbarHelper {
  static void showTopSnackbar(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16.o),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      ),
    );
  }
}
