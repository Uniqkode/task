import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/home_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<FetchHomeBlocEvent>((event, emit) async {
      try {
        ///dummy data
        const jsonData = '''
          {
            "location": "Stroll Bonfire",
            "age": "28",
            "name": "Angelina",
            "views": "145",
            "answer":"Mine is definitely the peace in the morning.",
            "time": "2024-03-08T10:30:00Z",
            "profilepicture": "assets/images/joey.png",
            "coverimage": "assets/images/man.png",
            "pQuestion":"What is your favorite time of the day?",
            "answers": [
              {
                "options": "A",
                "answers": "The peace in the early mornings"
              },
              {
                "options": "B",
                "answers": "The magical golden hours"
              },
              {
                "options": "C",
                "answers": "Wind-down time after dinners"
              },
              {
                "options": "D",
                "answers": "The serenity past midnight"
              }
            ]
          }
        ''';

        final homeModel = HomeModel.fromJson(jsonData);
        emit(HomeLoadedState(
            homeModel: homeModel, currentIndex: 0, selectedIndex: 0));
      } catch (e) {
        emit(HomeErrorState(error: e.toString()));
      }
    });

    on<UpdateIndexEvent>((event, emit) {
      if (state is HomeLoadedState) {
        emit((state as HomeLoadedState).copyWith(currentIndex: event.index));
      }
    });
    on<SelectTileEvent>((event, emit) {
      if (state is HomeLoadedState) {
        emit((state as HomeLoadedState).copyWith(selectedIndex: event.index));
      }
    });
  }
}

//Helper function for copying HomeLoadedState
extension HomeLoadedStateExtension on HomeLoadedState {
  HomeLoadedState copyWith({int? currentIndex, int? selectedIndex}) {
    return HomeLoadedState(
      homeModel: homeModel,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedIndex: selectedIndex ?? selectedIndex,
    );
  }
}
