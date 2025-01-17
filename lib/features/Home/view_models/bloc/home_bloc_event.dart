part of 'home_bloc_bloc.dart';

sealed class HomeBlocEvent {}

class FetchHomeBlocEvent extends HomeBlocEvent {}

class UpdateIndexEvent extends HomeBlocEvent {
  final int index;
  UpdateIndexEvent({required this.index});
}

class SelectTileEvent extends HomeBlocEvent {
  final int index;
  SelectTileEvent({required this.index});
}
