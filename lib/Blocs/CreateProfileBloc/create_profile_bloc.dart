import 'package:alumni/Blocs/CreateProfileBloc/CreateProfileEvent/create_profile_event.dart';
import 'package:alumni/Blocs/CreateProfileBloc/CreateProfileState/create_profile_state.dart';
import 'package:alumni/Pages/CreateProfile/Model/Request/form_request.dart';
import 'package:alumni/Pages/CreateProfile/form_data/form_data.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  PersonalDetailsRequest personalDetailsRequest = PersonalDetailsRequest();
  List<EducationDetailsRequest> educationDetails = [];
  List<ProfessionalDetailsRequest> professionalDetails = [];

  FormResponseData formResponseData = FormResponseData();
  CreateProfileBloc() : super(CreateProfileInitialState()) {
    on<CreateProfileSubmitEvent>((event, emit) async {
      emit(CreateProfileLoadingState());

      await formResponseData.createProfile(
          personalDetails: personalDetailsRequest,
          educationDetails: educationDetails,
          professionalDetails: professionalDetails);

      await Future.delayed(const Duration(seconds: 4), () {});
      CreateProfileInitialState();
      if (formResponseData.createProfileRes.data == null &&
          formResponseData.errorMessage != null) {
        emit(CreateProfileErrorState(
            Error: formResponseData.errorMessage.toString()));
      } else if (formResponseData.createProfileRes.success == true) {
        // ignore: use_build_context_synchronously
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const SignIn()),
            (route) => false);
      } else if (formResponseData.createProfileRes.success == false) {
        emit(CreateProfileErrorState(Error: "faile to create profile"));
      } 
      else {
        CreateProfileInitialState();
      }
    });
  }
}
