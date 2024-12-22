import 'package:paynowuz/export.dart';
import 'package:flutter/material.dart';


class DateTimeSelectorWidget extends StatelessWidget {
  final Future<void> Function() onSelectTime;

  const DateTimeSelectorWidget({super.key, required this.onSelectTime});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSelectTime,
          child:  Text(
            "select_time".tr(),
            style: TextStyle(fontSize: 14.o, fontWeight: FontWeight.w400, color: theme.textTheme.bodyLarge!.color),
          ),
        ),
      ],
    );
  }
}
