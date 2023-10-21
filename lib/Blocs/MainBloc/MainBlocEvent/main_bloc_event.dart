import 'package:flutter/material.dart';

abstract class MainBlocEvent {}

// signin Events

class SigninEvent extends MainBlocEvent {
  String username;
  String password;
  BuildContext context;

  SigninEvent(
      {required this.username, required this.password, required this.context});
}

class SigninRememberMeEvent extends MainBlocEvent {
  bool rememberMe;

  SigninRememberMeEvent({
    required this.rememberMe,
  });
}

class SampleEvent extends MainBlocEvent {} 

// alumni events


// class AlumniIdsLodingEvent extends MainBlocEvent {}

// class SuccessEvent extends MainBlocEvent {}
