abstract class VerifyOtpMainState {}

class VerifyOtpLoadingState extends VerifyOtpMainState {}

class VerifyOtpInitialState extends VerifyOtpMainState {}

class VerifyOtpErrorState extends VerifyOtpMainState {
  String Error;
  VerifyOtpErrorState({required this.Error});
}
