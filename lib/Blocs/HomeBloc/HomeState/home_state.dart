// Home states
abstract class HomeMainState {}

class HomeInitialState extends HomeMainState {}

// alumni states

class HomeIdsLoadingState extends HomeMainState {}

class HomeIdSuccessState extends HomeMainState {}

class HomeErrorState extends HomeMainState {
  final String? error;

  HomeErrorState(this.error);
}

// feeds states

class HomeFeedLoadingState extends HomeMainState {}

class HomeFeedSuccessState extends HomeMainState {}

class HomeFeedErrorState extends HomeMainState {
  final String? error;

  HomeFeedErrorState(this.error);
}

// view profile states

class HomeViewProfileLoadingState extends HomeMainState {}

class HomeViewProfileErrorState extends HomeMainState {
  final String? error;

  HomeViewProfileErrorState(this.error);
}

class HomeViewProfileInitialState extends HomeMainState {}

class HomeViewProfileSuccessState extends HomeMainState {}
