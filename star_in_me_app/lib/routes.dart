import 'package:star_in_me_app/authentication/forgot_password.dart';
import 'package:star_in_me_app/onboarding/UI1.dart';
import 'package:star_in_me_app/onboarding/UI2.dart';
import 'package:star_in_me_app/onboarding/UI3.dart';
import 'package:star_in_me_app/onboarding/UI4.dart';
import 'package:star_in_me_app/screens/UserProfile.dart';
import 'package:star_in_me_app/screens/accomplishments/awards.dart';
import 'package:star_in_me_app/screens/accomplishments/certification.dart';
import 'package:star_in_me_app/screens/accomplishments/education.dart';
import 'package:star_in_me_app/screens/accomplishments/patent.dart';
import 'package:star_in_me_app/screens/accomplishments/patent_pending.dart';
import 'package:star_in_me_app/screens/accomplishments/publication.dart';
import 'package:star_in_me_app/screens/accomplishments/volunteer.dart';
import 'package:star_in_me_app/screens/accomplishments/work_experience.dart';
import 'package:star_in_me_app/screens/createpost.dart';
import 'package:star_in_me_app/screens/landing.dart';
import 'package:star_in_me_app/resources.dart';

import 'onboarding/UI3.dart';
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
  UI2.onboardingUi2: (context) => UI2(),
  UI3.onboardingUi3: (context) => UI3(),

  UI4.onboardingUi4: (context) => UI4(),

  CreatePost.CreatePostId: (context) => CreatePost(),

  //User Profile Routes
  UserProfile.userProfileId: (context) => UserProfile(),

  //Blog or resources Routes
  Resources.ResourcesId: (context) => Resources(),

  //Accomplishments Routes
  WorkExperience.workExperienceId: (context) => WorkExperience(),
  Volunteer.volunteerId: (context) => Volunteer(),
  Education.educationId: (context) => Education(),
  Certification.certificationId: (context) => Certification(),
  Publication.publicationId: (context) => Publication(),
  Patent.patentId: (context) => Patent(),
  PatentPending.patenPendingtId: (context) => PatentPending(),
  Awards.awardsId: (context) => Awards()
};
