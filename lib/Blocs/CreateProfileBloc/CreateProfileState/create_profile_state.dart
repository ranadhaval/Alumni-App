abstract class CreateProfileState {}

class CreateProfileInitialState extends CreateProfileState {}

class CreateProfileLoadingState extends CreateProfileState {}

class CreateProfileErrorState extends CreateProfileState {
  String Error;
  CreateProfileErrorState({required this.Error});
}
