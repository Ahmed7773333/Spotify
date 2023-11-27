// ignore_for_file: must_be_immutable
part of 'home_layout_bloc.dart';

enum ScreenStatus {
  init,
  homeLoading,
  searchLoading,
  userPlayListsSuccess,
  userPlayListsError,
  newSongsSuccess,
  newSongsError,
  podcastsSuccess,
  podcastsError,
  searchSuccess,
  searchError,
  categorySuccess,
  categoryError,
}

@immutable
class HomeLayoutState {
  ScreenStatus? status;
  List<OnePlayList>? userPlayList;
  List<Song>? newSong;
  List<Shows>? podcasts;
  List<AlbumSearched>? albums;
  List<Categoriess>? categories;

  Failures? failures;

  HomeLayoutState(
      {this.status,
      this.userPlayList,
      this.failures,
      this.newSong,
      this.podcasts,
      this.albums,
      this.categories});

  HomeLayoutState copWith(
      {ScreenStatus? status,
      List<OnePlayList>? userPlayList,
      List<Song>? newSong,
      List<Shows>? podcasts,
      List<AlbumSearched>? albums,
      List<Categoriess>? categories,
      Failures? failures}) {
    return HomeLayoutState(
      failures: failures ?? this.failures,
      status: status ?? this.status,
      userPlayList: userPlayList ?? this.userPlayList,
      newSong: newSong ?? this.newSong,
      podcasts: podcasts ?? this.podcasts,
      albums: albums ?? this.albums,
      categories: categories ?? this.categories,
    );
  }
}

class HomeInitial extends HomeLayoutState {
  HomeInitial() : super(status: ScreenStatus.init);
}
