// alumni states
abstract class AlumniState {}

class AlumniInitialState extends AlumniState {}

class AlumniLoadingState extends AlumniState {}

class AlumniSuccessState extends AlumniState {}

class AlumniErrorState extends AlumniState {
  final String? error;

  AlumniErrorState(this.error);
}
