abstract class SignUpMainState {}

class SignUpLoadingState extends SignUpMainState {}

class SignUPInitialState extends SignUpMainState {}

class SignUpSuccessState extends SignUpMainState {}




class SignUpErrorState extends SignUpMainState {
  String Error;
  SignUpErrorState({required this.Error});
}

class LodingState extends SignUpMainState {}


