import 'package:flutter/material.dart';

abstract class SignUpMainEvent {}

class SignupEvent extends SignUpMainEvent {
  String firstName;
  String lastName;
  String email;
  String password;
  String school;
  String passingClass;
  String passingYear;
  String classRollNumber;
  BuildContext context;
  int parentUserId;

  SignupEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.school,
    required this.passingClass,
    required this.passingYear,
    required this.classRollNumber,
    required this.context,
    required this.parentUserId,
  });
}

class GetBranchEvent extends SignUpMainEvent {}
