import 'package:alumni/Pages/CreateProfile/UI/create_profile.dart';
import 'package:alumni/Pages/Home/home.dart';
import 'package:alumni/Pages/Signup/UI/registrationRequest.dart';
import 'package:alumni/Pages/Signup/UI/signup.dart';
import 'package:alumni/Pages/Welcome/welcomepage.dart';
import 'package:alumni/Pages/Welcome/welcomeScreen2.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Pages/OnBoarding/onboarding.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';


Map<String, WidgetBuilder> routes = {
  //Start Screens
  OnboardScreen.routeName: (context) => const OnboardScreen(),

  // Sign in
  SignIn.routeName: (context) => SignIn(),
  Welcome.routeName: (context) => const Welcome(),

  // Registration
  Signup.routeName: (context) => const Signup(),
  RegistrationReq.routeName: (context) => const RegistrationReq(),

  // Create Profile
  // CreateProfile.routeName: (context) => const CreateProfile(),
  Welcome2.routeName: (context) => const Welcome2(),

  //Home
  Home.routeName: (context) => const Home(),
};
