import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/home_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocEvent>((event, emit) {
      emit(HomeBlocInitial());
      try {
        const jsonData = '''
          {
            "location": "Stroll Bonfire",
            "age": "28",
            "name": "Angelina",
            "views": "145",
            "answer": “Mine is definitely the peace in the morning.”
            "time": "2024-03-08T10:30:00Z",
            "profilepicture": "assets/images/man.png",
            "coverimage": "assets/images/joey.png",
            "pQuestion":"What is your favorite time of the day?"
            "answers": [
              {
                "options": "A",
                "answers": "The peace in the early mornings",
              },
              {
                "options": "B",
                "answers": "The magical golden hours",
              }
              {
                "options": "C",
                "answers": "Wind-down time after dinners",
              }
              {
                "options": "D",
                "answers": "The serenity past midnight",
              }
            ]
          }
        ''';

        final homeModel = HomeModel.fromJson(jsonData);
        emit(HomeBlocLoadedState(homeModel: homeModel));
      } catch (e) {
        emit(HomeBlocErrorState(error: e.toString()));
      }
    });
  }
}
