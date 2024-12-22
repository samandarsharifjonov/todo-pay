import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class HomeUI extends StatefulWidget {
  static const routName = '/home-screen';

  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final data = Provider.of<Users>(context, listen: false);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          HeaderWidget(data: data),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 10.h),
                  child: Text(
                    "last_transactions".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: theme.textTheme.bodyLarge!.color),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<Users>(
              builder: (context, users, child) {
                return users.list.isNotEmpty
                    ? ListView.builder(
                        itemCount: users.list.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final user = users.list[index];
                          final formattedDate = DateFormat('d-MMM')
                              .format(users.list[index].dateTime as DateTime);
                          return Slidable(
                            endActionPane:
                                ActionPane(motion: StretchMotion(), children: [
                              SlidableAction(
                                onPressed: (context) {
                                  if (_isMounted) {
                                    users.delete(
                                        index, users.list[index].isPrice);
                                  }
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ]),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 23,
                                backgroundImage:
                                    FileImage(File(user.imageFile)),
                              ),
                              title: Text(
                                user.name,
                                style: TextStyle(
                                    color: theme.textTheme.bodyLarge!.color,
                                    fontSize: 14),
                              ),
                              subtitle: Text(
                                "${formattedDate} ${users.list[index].time?.format(context)}",
                                style: TextStyle(
                                    color: theme.textTheme.bodyLarge!.color),
                              ),
                              trailing: users.list[index].isPrice == true
                                  ? Text(
                                      "-\$${user.amount.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "+\$${user.amount.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                Assets.imagesEmpty_illustration),
                          ),
                          Text(
                            "no_transactions_yet".tr(),
                            style: TextStyle(
                                color: Color.fromRGBO(155, 155, 155, 1)),
                          )
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

