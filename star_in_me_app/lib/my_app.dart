import 'package:flutter/material.dart';
import 'screens/landing.dart';
import 'package:star_in_me_app/onboarding/UI1.dart';
import 'package:star_in_me_app/onboarding/UI4.dart';
import 'constants.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'routes.dart';
import 'resources.dart';
import 'package:animated_splash/animated_splash.dart';
import 'screens/thankyou_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kStatusBarColor));

    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something Wrong to Initialize Flutter Firebase");
            return null;
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

           //   initialRoute: UI1.onboardingUi1,
              initialRoute: UI4.onboardingUi4,

              //LandingPage.landingPageId
            //  initialRoute: ThankYou.thankYouPage,

              routes: routes,
            );
          }
          return Loading(
              indicator: BallPulseIndicator(), size: 50.0, color: Colors.blue);
        });
  }
}

// ThankYou.thankYouPage
