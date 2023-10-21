import 'package:alumni/Blocs/HomeBloc/HomeEvent/home_event.dart';
import 'package:alumni/Blocs/HomeBloc/HomeState/home_state.dart';
import 'package:alumni/Pages/MyAlumni/AlumniResponseData/alumni_data.dart';
import 'package:alumni/Pages/MyAlumni/AlumniResponseData/view_alumni_profile_data.dart';
import 'package:alumni/Pages/MyFeed/Feed_data.dart/feed_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeMainState> {
  AlumniResponse alumniResponse = AlumniResponse();
  FeedData feedData = FeedData();
  ViewProfileData viewProfileData = ViewProfileData();

  Future<void> processMultipleEvents(List<HomeEvent> events) async {
    for (final event in events) {
      add(event); // Dispatch each event one by one
      await Future.delayed(Duration(milliseconds: 500)); // Add delay if needed
    }
  }

  HomeBloc() : super(HomeInitialState()) {
    // for alumniIds  and feed getting
    on<HomeIdsLodingEvent>((event, emit) async {
      emit(HomeIdsLoadingState());
      await alumniResponse.getAlumniIds();
      await Future.delayed(const Duration(seconds: 4));
      print(alumniResponse.alumniFeedIdRes.success);
      emit(HomeInitialState());
      if (alumniResponse.alumniFeedIdRes.success == false) {
        emit(HomeErrorState("SOMETHING WENT WRONG"));
      } else if (alumniResponse.alumniFeedIdRes.success == true) {
        emit(HomeIdSuccessState());
      } else if (alumniResponse.alumniFeedIdRes.success == false ||
          (alumniResponse.alumniFeedIdRes.data == null &&
              alumniResponse.errorMessage != null)) {
        emit(HomeErrorState(alumniResponse.errorMessage));
      }
    });

    on<HomeFeedIdsLodingEvent>((event, emit) async {
      emit(HomeFeedLoadingState());
      await feedData.getFeedData();
      await Future.delayed(const Duration(seconds: 4));
      print(feedData.feedRes.success);
      emit(HomeInitialState());
      if (feedData.feedRes.success == false) {
        emit(HomeFeedErrorState("SOMETHING WENT WRONG"));
      } else if (feedData.feedRes.success == true) {
        emit(HomeFeedSuccessState());
      } else if (feedData.feedRes.success == false ||
          (feedData.feedRes.data == null && feedData.errorMessage != null)) {
        emit(HomeFeedErrorState(feedData.errorMessage));
      }
    });

    // for view alumni profile

    on<HomeViewProfileEvent>((event, emit) async {
      try {
        emit(HomeViewProfileLoadingState());
        await viewProfileData.getViewAlumniIds(id: event.id);
        await Future.delayed(const Duration(seconds: 2), () {
          print(viewProfileData.viewAlumniProfileRes.success);
          emit(HomeViewProfileInitialState());
          if (viewProfileData.viewAlumniProfileRes.success == false) {
            emit(HomeViewProfileErrorState("SOMETHING WENT WRONG"));
          } else if (viewProfileData.viewAlumniProfileRes.success == true) {
            emit(HomeViewProfileSuccessState());
          } else if (viewProfileData.viewAlumniProfileRes.success == false ||
              (viewProfileData.viewAlumniProfileRes.data == null &&
                  viewProfileData.viewError != null)) {
            emit(HomeViewProfileErrorState(viewProfileData.viewError));
          }
        });
      } catch (e) {
        print(e);
      }
    });
  }

  loadFeed(HomeIdsLodingEvent event, Emitter<HomeMainState> emit) async {
    emit(HomeIdsLoadingState());
    await feedData.getFeedData();
    await Future.delayed(const Duration(seconds: 4));
    print(feedData.feedRes.success);
  }
}
