import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theable_new/globals/ableui.dart';
import 'package:theable_new/pages/login_page.dart';
import 'package:theable_new/pages/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //fixed orientation, only portrait mode allowed
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // // making content draw behind the system navigation bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // making the navigation bar translucent
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     // systemNavigationBarColor: Colors.transparent, // Android navigation bar color
    //     // systemNavigationBarIconBrightness: Brightness.dark, // Icon brightness
    //   ),
    // );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          elevation: 0,
          // backgroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: AbleUi.brandColor),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: AbleUi.buttonFontSize,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0,
            backgroundColor: AbleUi.brandColor,
            disabledBackgroundColor: Colors.blueGrey.shade100,
            disabledForegroundColor: Colors.white,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: const Size(double.infinity, AbleUi.buttonHeight),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: AbleUi.buttonFontSize,
            ),
            // elevation: 0,
            // disabledBackgroundColor: Colors.black38,
            // disabledForegroundColor: Colors.white70,
            // backgroundColor: primaryAppColor,
            // foregroundColor: Colors.white,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AbleUi.roundRadius)),
            // maximumSize: Size(60, 200),
            // minimumSize: const Size(double.infinity, 50),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          constraints: const BoxConstraints(minHeight: AbleUi.buttonHeight),
          hintStyle: const TextStyle(
            fontSize: AbleUi.buttonFontSize,
            color: Colors.black38,
          ),
          errorStyle: const TextStyle(
            fontSize: AbleUi.buttonFontSize,
          ),
          isDense: true,
          isCollapsed: false,

          // alignLabelWithHint: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AbleUi.rectangularRadius),
            borderSide: const BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AbleUi.rectangularRadius),
            borderSide: const BorderSide(
              color: Colors.black38,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AbleUi.rectangularRadius),
            borderSide: const BorderSide(
              color: AbleUi.brandColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AbleUi.rectangularRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AbleUi.rectangularRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
      // home: const LoginPage(),
      home: const SignUpPage(),
    );
  }
}
