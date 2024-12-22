import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final darkMode = Provider.of<ThemeProvider>(context);

    return Consumer<Users>(
      builder: (context, users, child) {
        return Container(
          height: 70,
          width: 70,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: darkMode.isDarkMode ? theme.disabledColor : Color.fromRGBO(243, 244, 245, 1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: users.image != null ? Container(
            height: 70,
            width: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.file(
              File(users.image??"")
            ),

          ) : Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(onPressed: (){
              users.pickImage();
            }, icon: Icon(Icons.camera_alt_outlined)),
          )
        );
      },
      
    );
  }
}
