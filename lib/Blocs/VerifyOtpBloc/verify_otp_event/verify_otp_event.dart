import 'package:flutter/material.dart';

abstract class VerifyOtpMainEvent {}

class VerifyOtpEvent extends VerifyOtpMainEvent {
  int userOtp;
  int userId;
  BuildContext context;

  VerifyOtpEvent({
    required this.userOtp,
    required this.userId,
    required this.context
  });
}
