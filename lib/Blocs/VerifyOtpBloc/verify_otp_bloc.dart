import 'package:alumni/Blocs/VerifyOtpBloc/sverify_otp_state/verify_otp_state.dart';
import 'package:alumni/Blocs/VerifyOtpBloc/verify_otp_event/verify_otp_event.dart';
import 'package:alumni/Pages/Signup/UI/registrationRequest.dart';
import 'package:alumni/Pages/Signup/response/regestration_response.dart';
import 'package:alumni/Pages/VerifyOtp/VerifyOtpRes/verify_otp_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpMainEvent, VerifyOtpMainState> {
  RegestrationRes regestrationRes = RegestrationRes();
  VerifyOtpData verifyOtpData = VerifyOtpData();
  GetStorage storage = GetStorage();
  VerifyOtpBloc() : super(VerifyOtpInitialState()) {
    registartionDataGetter();

    on<VerifyOtpEvent>(
      (event, emit) async {
        regestrationRes.message = null;
        emit(VerifyOtpLoadingState());
        await verifyOtpData.getverifyOtp(
            userOtp: event.userOtp, userId: event.userId);
        await Future.delayed(const Duration(seconds: 4));
        emit(VerifyOtpInitialState());

        // ignore: unnecessary_null_comparison
        if (verifyOtpData.verifyOtpRes == null ||
            verifyOtpData.errorMessage != null) {
          emit(VerifyOtpErrorState(
              Error: verifyOtpData.errorMessage.toString()));
        } else if (verifyOtpData.verifyOtpRes.success == false) {
          emit(VerifyOtpErrorState(
              Error: verifyOtpData.verifyOtpRes.message.toString()));
        } else if (verifyOtpData.verifyOtpRes.success == true) {
          // ignore: use_build_context_synchronously
          Navigator.of(event.context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const RegistrationReq(),
              ),
              (route) => false);
        }
      },
    );
  }

  void registartionDataGetter() async {
    regestrationRes = await storage.read("RegistrationResponse");
  }
}
