import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class Onboarding extends StatefulWidget {
  static const routName = '/onboarding-screen';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _pageController = PageController();

  final onboardingInfo = OnboardingInfo();
  int dotIndex = 0;

  Widget dotIndicator({required Color color}) {
    return Container(
      height: 5.h,
      width: 15.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final imgProviderModel = Provider.of<ImageProviderModel>(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    dotIndex = value;
                  });
                },
                controller: _pageController,
                itemCount: onboardingInfo.items.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                      svgPicture: onboardingInfo.items[index].svgPicture,
                      title: onboardingInfo.items[index].title);
                },
              ),
            ),
            if (dotIndex == 2)
              GetStartedButton(onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routName);
              })
          ],
        ),
        bottomNavigationBar: SizedBox(
            height: 100.h,
            child: dotIndex != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routName);
                          },
                          child: Text(
                            "skip".tr(),
                            style: TextStyle(
                                fontSize: 16.o,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(26, 135, 221, 1)),
                          )),
                      DotIndicator(dotIndex: dotIndex),
                      TextButton(
                        onPressed: () {
                          if (dotIndex < onboardingInfo.items.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInCubic,
                            );
                          } else {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routName);
                          }
                        },
                        child: Text(
                          "next".tr(),
                          style: TextStyle(
                            fontSize: 16.o,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(26, 135, 221, 1),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()));
  }
}
