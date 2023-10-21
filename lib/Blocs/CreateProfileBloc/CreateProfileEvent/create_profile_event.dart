import 'package:flutter/material.dart';

abstract class CreateProfileEvent {}

class CreateProfileSubmitEvent extends CreateProfileEvent {
  BuildContext context;
  CreateProfileSubmitEvent({required this.context});
}


