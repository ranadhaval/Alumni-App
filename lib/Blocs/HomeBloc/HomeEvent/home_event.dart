abstract class HomeEvent {}

class HomeIdsLodingEvent extends HomeEvent {}

class HomeViewProfileEvent extends HomeEvent {
  String id;
  HomeViewProfileEvent({required this.id});
}

class HomeFeedIdsLodingEvent extends HomeEvent {}
