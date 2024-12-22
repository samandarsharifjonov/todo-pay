import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

import '../home/home.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _formKey = GlobalKey<FormState>();
  String? text;
  String? fullName;
  double? amount;
  TimeOfDay? time;
  DateTime? _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        selectTime(context);
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        time = pickedTime;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //selectedDate = Provider.of<DateTimeProvider>(context, listen: false).selectedDate;
      final usersImg =
          Provider.of<ImageRequestProvider>(context, listen: false);
      Provider.of<Users>(context, listen: false).requestPayUser(
          fullName!, amount!, usersImg.image.toString(), _selectedDate!, time!);

      usersImg.restartImg();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "User $fullName with amount \$${amount!} added successfully",
            )),
      );

      Navigator.of(context).pushReplacementNamed(HomeUI.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          "request_money".tr(),
          style: TextStyle(fontSize: 20.o, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            const CustomDivider(),
            SizedBox(
              height: 9.h,
            ),
            const RequestUploadImageWidget(),
            SizedBox(
              height: 40.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  children: [
                    FormFieldsWidget(
                      nameHint: 'full_name'.tr(),
                      amountHint: 'request_money'.tr(),
                      validateText: 'the_field_is_empty'.tr(),
                      borderColor: const Color.fromRGBO(26, 135, 221, 1),
                      formKey: _formKey,
                      onSavedName: (value) {
                        fullName = value;
                      },
                      onSavedAmount: (value) {
                        if (value! > 0) {
                          amount = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DateTimeSelectorWidget(
                          onSelectTime: () async {
                            await selectDate(context);
                          },
                        ),
                        Text(
                            "${DateFormat("d-MMM yyyy").format(_selectedDate ?? DateTime.now())}  ${time != null ? time?.format(context) : TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute).format(context)}"),
                      ],
                    ),
                    SizedBox(
                      height: 22.o,
                    ),
                    Consumer<ImageRequestProvider>(
                      builder: (context, value, child) {
                        return SubmitButtonWidget(
                          icon: Assets.iconsRequest,
                          title: "request_payment".tr(),
                          onPressed: _selectedDate != null && time != null && value.image != null ? _submit : () {
                            if(value.image == null ){
                              SnackbarHelper.showTopSnackbar(context, "upload_an_image".tr());
                            }
                            if (_selectedDate == null && time == null) {
                              SnackbarHelper.showTopSnackbar(
                                  context, "select_the_date_and_time".tr());
                            }
                          },
                          textColor: Colors.white,
                          color: Color.fromRGBO(26, 135, 221, 1),
                        );
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
