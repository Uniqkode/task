part of 'home_bloc_bloc.dart';

// States for the ListItemsBloc
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadedState extends HomeBlocState {
  final HomeModel homeModel;
  final int currentIndex;
  final int? selectedIndex; // Add selectedIndex

  HomeLoadedState({
    required this.homeModel,
    required this.currentIndex,
    this.selectedIndex,
  });
}

class HomeErrorState extends HomeBlocState {
  final String error;
  HomeErrorState({required this.error});
}
