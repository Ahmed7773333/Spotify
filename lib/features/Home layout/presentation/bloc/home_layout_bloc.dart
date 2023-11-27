import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/Home%20layout/data/models/new_song_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/playlists_model.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/categories.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/new_release.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/playlists.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/podcasts.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/search.dart';

import '../../../../core/eror/failuers.dart';
import '../../data/models/album_model.dart';
import '../../data/models/categories_mode.dart';
import '../../data/models/podcast_model.dart';

part 'home_layout_event.dart';
part 'home_layout_state.dart';

class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  static HomeLayoutBloc get(context) => BlocProvider.of(context);
  UserPlaylistsUseCase playlistsUseCase;
  NewReleaseUseCase newReleaseUseCase;
  PodcastsUseCase podcastsUseCase;
  SearchUseCase searchUseCase;
  CategoriesUseCase categoriesUseCase;

  HomeLayoutBloc(this.playlistsUseCase, this.newReleaseUseCase,
      this.podcastsUseCase, this.searchUseCase, this.categoriesUseCase)
      : super(HomeInitial()) {
    on<HomeLayoutEvent>((event, emit) async {
      if (event is GetUserPlaylists) {
        emit(state.copWith(status: ScreenStatus.homeLoading));
        var result = await playlistsUseCase();
        result.fold((l) {
          emit(state.copWith(
              status: ScreenStatus.userPlayListsError, failures: l));
        }, (r) {
          emit(state.copWith(
              status: ScreenStatus.userPlayListsSuccess,
              userPlayList: r.items));
        });
      } else if (event is GeNewSongs) {
        emit(state.copWith(status: ScreenStatus.homeLoading));
        var result = await newReleaseUseCase();
        result.fold((l) {
          emit(state.copWith(status: ScreenStatus.newSongsError, failures: l));
        }, (r) {
          emit(state.copWith(
              status: ScreenStatus.newSongsSuccess, newSong: r.albums?.items));
        });
      } else if (event is GetCategories) {
        emit(state.copWith(status: ScreenStatus.homeLoading));
        var result = await categoriesUseCase();
        result.fold((l) {
          emit(state.copWith(status: ScreenStatus.categoryError, failures: l));
        }, (r) {
          emit(state.copWith(
              status: ScreenStatus.categorySuccess,
              categories: r.categories?.items));
        });
      } else if (event is GetPodcasts) {
        emit(state.copWith(status: ScreenStatus.homeLoading));
        var result = await podcastsUseCase();
        result.fold((l) {
          emit(state.copWith(status: ScreenStatus.podcastsError, failures: l));
        }, (r) {
          emit(state.copWith(
              status: ScreenStatus.podcastsSuccess, podcasts: r.shows));
        });
      } else if (event is SearchForAlbum) {
        emit(state.copWith(status: ScreenStatus.searchLoading));
        var result = await searchUseCase(event.query);
        result.fold((l) {
          emit(state.copWith(status: ScreenStatus.searchError, failures: l));
        }, (r) {
          emit(state.copWith(
              status: ScreenStatus.searchSuccess, albums: r.albums?.items));
        });
      }
    });
  }
}
