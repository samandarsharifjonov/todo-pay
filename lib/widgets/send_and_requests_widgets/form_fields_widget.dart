import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class FormFieldsWidget extends StatelessWidget {
  final String nameHint;
  final String amountHint;
  final String validateText;
  final Color borderColor;
  final GlobalKey<FormState> formKey;
  final void Function(String?) onSavedName;
  final void Function(double?) onSavedAmount;

  const FormFieldsWidget({
    super.key,
    required this.nameHint,
    required this.amountHint,
    required this.formKey,
    required this.validateText,
    required this.borderColor,
    required this.onSavedName,
    required this.onSavedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: onSavedName,
            validator: (value) => value!.isEmpty ? validateText : null,
            decoration: InputDecoration(
              hintText: nameHint,
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 45.h),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (value) => onSavedAmount(double.tryParse(value!)),
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'the_field_is_empty'.tr();
              }
              double? parsedValue = double.parse(value);
              if(parsedValue == null || parsedValue <= 0){
                return "positive_value_error".tr();
              }
            },
            decoration: InputDecoration(
              hintText: amountHint,
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
