import 'package:alumni/Blocs/CreateProfileBloc/CreateProfileEvent/create_profile_event.dart';
import 'package:alumni/Blocs/CreateProfileBloc/create_profile_bloc.dart';
import 'package:alumni/Blocs/MainBloc/MainBlocEvent/main_bloc_event.dart';
import 'package:alumni/Blocs/MainBloc/MainBlocState/main_bloc_state.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/CreateProfile/UI/create_profile.dart';
import 'package:alumni/Pages/MyAlumni/AlumniResponseData/alumni_data.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/signin_response.dart';
import 'package:alumni/Pages/Sign%20in/SigninRes/signin_data.dart';
import 'package:alumni/Pages/Welcome/welcomepage.dart';
import 'package:alumni/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  SigninResponseData signinResponseData = SigninResponseData();
  AlumniResponse alumniResponse = AlumniResponse();
  bool rememberMe = false;
  List<TextEditingController> controllers = getTextController(2);

  GetStorage storage = GetStorage();

  MainBloc() : super(MainInitialState()) {
    // for signin
    on<SampleEvent>(
      (event, emit) {
        signinResponseData.getBranches();
      },
    );
    if ((storage.read("Email") != null) &&
        (storage.read("Password") != null) &&
        (storage.read("rememberMe") != null)) {
      controllers[0].text = storage.read("Email");
      controllers[1].text = storage.read("Password");
      rememberMe = storage.read("rememberMe");
    }

    on<SigninEvent>(
      (event, emit) async {
        signinResponseData.errorMessage = null;

        emit(LodingState());
        await signinResponseData.getSigin(
          email: event.username,
          password: event.password,
        );
        await Future.delayed(const Duration(seconds: 3));
        emit(SigninInitialState());

        SigninRes signinRes = signinResponseData.signinRes;

        if (signinRes.data == null && signinResponseData.errorMessage != null) {
          emit(SigninErrorState(
              Error: "Error: ${signinResponseData.errorMessage}"));
        } else if (signinResponseData.signinRes.success == false) {
          emit(SigninErrorState(Error: "Error: Something went wrong"));
        } else if (signinResponseData.signinRes.success == true) {
          storage.write("Token", signinRes.token);
          if (signinResponseData.signinRes.data!.isProfileCompleted == false) {
            // ignore: use_build_context_synchronously
            Navigator.of(event.context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (_) => BlocProvider(
                          create: (context) => CreateProfileBloc(),
                          child: CreateProfile(
                              signinRes: signinResponseData.signinRes),
                        )),
                (route) => false);
          } else if (signinResponseData.signinRes.data!.isProfileCompleted ==
              true) {
            Navigator.of(context!).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const Welcome()),
                (route) => false);
          }
        } else {
          emit(MainInitialState());
        }
      },
    );

    on<SigninRememberMeEvent>(
      (event, emit) {
        if (rememberMe) {
          storage.write("Email", controllers[0].text);
          storage.write("Password", controllers[1].text);
          storage.write("rememberMe", true);

          // emit(SigninRememberMeState());
        } else if (!rememberMe) {
          storage.write("Email", "");
          storage.write("Password", "");
          storage.write("rememberMe", false);
        }
      },
    );
  }
}
