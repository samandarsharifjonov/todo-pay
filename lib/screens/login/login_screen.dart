import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';
import 'package:paynowuz/screens/login/widgets/open_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  String? text;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!mounted) return;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final openButtonOffset = isKeyboardVisible ? 10.h : 70.h;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          Padding(
            padding: EdgeInsets.only(top: 201),
            child: Column(
              children: [
                UploadImageWidget(),
                SizedBox(height: openButtonOffset),
                // Form va TextFormField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      onChanged: (value) => setState(() {
                        text = value.trim().isEmpty ? null : value.trim();
                      }),
                      onSaved: (newValue) {
                        if (newValue != null && newValue.trim().isNotEmpty) {
                          Provider.of<Users>(context, listen: false)
                              .addUser(newValue.trim());
                        }
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "name".tr(),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                // OpenButton
                OpenButton(
                  text: text,
                  onSubmit: _submit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
