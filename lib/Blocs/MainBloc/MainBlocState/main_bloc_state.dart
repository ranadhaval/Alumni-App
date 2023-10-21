abstract class MainBlocState {}

// main bloc state

class MainInitialState extends MainBlocState {}

class LodingState extends MainBlocState {}

// Signin states

class SigninInitialState extends MainBlocState {}

class SigninLoadingState extends MainBlocState {}

class SigninRememberMeState extends MainBlocState {}

class SigninNoRememberMeState extends MainBlocState {}

class SigninSuccessState extends MainBlocState {}

class SigninErrorState extends MainBlocState {
  String Error;
  SigninErrorState({required this.Error});
}

// alumni states


class AlumniInitialState extends MainBlocState {}

class AlumniLoadingState extends MainBlocState {}

class AlumniSuccessState extends MainBlocState {}

class AlumniErrorState extends MainBlocState {
  final String? error;

  AlumniErrorState(this.error);
}
