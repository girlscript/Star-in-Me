import 'package:star_in_me_app/authentication/forgot_password.dart';
import 'package:star_in_me_app/onboarding/UI1.dart';
import 'package:star_in_me_app/screens/UserProfile.dart';
import 'package:star_in_me_app/screens/landing.dart';
import 'package:star_in_me_app/resources.dart';

import 'screens/thankyou_screen.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'authentication/login.dart';
import 'authentication/signup.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //index Page Routes
  LandingPage.landingPageId: (context) => LandingPage(),

  //Auth Routes
  LoginPage.loginPageId: (context) => LoginPage(),
  SignupPage.signUpPageId: (context) => SignupPage(),
  ForgotPassword.forgotPassword: (context) => ForgotPassword(),
  ThankYou.thankYouPage: (context) => ThankYou(),

  //Onboarding Routes
  UI1.onboardingUi1: (context) => UI1(),

  //User Profile Routes
  UserProfile.userProfileId: (context) => UserProfile(),

  //Blog or resources Routes
  Resources.ResourcesId: (context) => Resources(),
};
