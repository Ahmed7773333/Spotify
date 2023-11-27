part of 'home_layout_bloc.dart';

abstract class HomeLayoutEvent extends Equatable {
  const HomeLayoutEvent();

  @override
  List<Object> get props => [];
}

class GetUserPlaylists extends HomeLayoutEvent {}

class GeNewSongs extends HomeLayoutEvent {}

class GetPodcasts extends HomeLayoutEvent {}

class GetCategories extends HomeLayoutEvent {}

class SearchForAlbum extends HomeLayoutEvent {
  final String query;

  const SearchForAlbum({required this.query});
}
