import 'package:alumni/Blocs/SignUpBloc/signup_event/signup_event.dart';
import 'package:alumni/Blocs/SignUpBloc/signup_state/signup_state.dart';
import 'package:alumni/Blocs/VerifyOtpBloc/verify_otp_bloc.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/get_school_branches.dart';
import 'package:alumni/Pages/Signup/regestration_data/regestartion_data.dart';
import 'package:alumni/Pages/VerifyOtp/UI/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class SignUpBloc extends Bloc<SignUpMainEvent, SignUpMainState> {
  RegestrationResponseData regestrationResponseData =
      RegestrationResponseData();
  GetStorage storage = GetStorage();
  GetSchoolBranches getSchoolBranches = GetSchoolBranches();
  List<SchoolBranches>? schoolBranches = [];
  SignUpBloc() : super(SignUPInitialState()) {
    on<GetBranchEvent>((event, emit) {
      emit(SignUPInitialState());
      getSchoolBranches = (storage.read("SchoolBranches"));
      // await Future.delayed(const Duration(seconds: 3));
      schoolBranches = getSchoolBranches.schoolBranches;
      print(schoolBranches!.length);
    });

    on<SignupEvent>((event, emit) async {
      regestrationResponseData.errorMessage = null;
      emit(SignUpLoadingState());
      await regestrationResponseData.getRegister(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          school: event.school,
          passingYear: event.passingYear,
          passingClass: event.passingClass,
          classRollNumber: event.classRollNumber,
          password: event.password,
          parentUserId: event.parentUserId);
      await Future.delayed(const Duration(seconds: 3));
      emit(SignUPInitialState());

      if (regestrationResponseData.regestrationRes.data == null ||
          regestrationResponseData.errorMessage != null) {
        emit(SignUpErrorState(
            Error: regestrationResponseData.errorMessage.toString()));
      } else if (regestrationResponseData.regestrationRes.success == true) {
        // ignore: use_build_context_synchronously

        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => BlocProvider(
                      create: (context) => VerifyOtpBloc(),
                      child: VerifyOtp(
                        email: event.email,
                        userId:
                            regestrationResponseData.regestrationRes.data!.id!,
                      ),
                    )),
            (route) => false);
      }
    });
  }
}
