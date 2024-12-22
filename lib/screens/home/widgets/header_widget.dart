import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class HeaderWidget extends StatelessWidget {
  final Users data;

  const HeaderWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesHomeBg),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 53, left: 30, right: 30),
        child: Consumer<Users>(
          builder: (context, users, child) {
            print(users.name);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "dashboard".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    ProfileButton(),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "${"hi".tr()} ${users.name}",
                  style: TextStyle(
                    color: Color.fromRGBO(141, 195, 238, 1),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "total_balance".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "\$${users.summa}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
