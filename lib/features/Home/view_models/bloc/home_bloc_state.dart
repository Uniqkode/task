part of 'home_bloc_bloc.dart';

// States for the ListItemsBloc
@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoadedState extends HomeBlocState {
  final HomeModel homeModel;
  HomeBlocLoadedState({required this.homeModel});
}

class HomeBlocErrorState extends HomeBlocState {
  final String error;
  HomeBlocErrorState({required this.error});
}
