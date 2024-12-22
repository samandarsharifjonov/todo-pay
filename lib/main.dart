import 'package:flutter/material.dart';
import 'export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('uz'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Users()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ImageSendProvider()),
        ChangeNotifierProvider(create: (_) => ImageRequestProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            themeMode: themeProvider.themeMode,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              height = MediaQuery.of(context).size.height / 812;
              width = MediaQuery.of(context).size.width / 375;
              arif = (height + width) / 2;
              return MediaQuery(data: MediaQuery.of(context), child: child!);
            },
            //
            home: const InitialScreen(),
            routes: {
              Onboarding.routName: (context) => const Onboarding(),
              LoginScreen.routName: (context) => const LoginScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}



