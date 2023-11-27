import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/categories_mode.dart';
import 'package:spotify_app/features/Home%20layout/data/models/new_song_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/playlists_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/podcast_model.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/album_model.dart';
import 'home_remote_ds.dart';

class HomeRemoteDSImpl implements HomeRemoteDS {
  ApiManager apiManager;

  HomeRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, PlaylistModel>> getUserPlayLists() async {
    try {
      Response response = await apiManager.getData(EndPoints.getUserPlaylists);
      PlaylistModel model = PlaylistModel.fromJson(response.data);
      debugPrint(model.total.toString());
      return Right(model);
    } catch (e) {
      debugPrint(e.toString());
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PodcastShow>> getPodcasts() async {
    try {
      Response response = await apiManager.getData(EndPoints.podcastsForHome);
      PodcastShow model = PodcastShow.fromJson(response.data);
      return Right(model);
    } catch (e) {
      debugPrint(e.toString());
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, NewSong>> getNewSongs() async {
    try {
      Response response = await apiManager.getData(EndPoints.newRelease);
      NewSong model = NewSong.fromJson(response.data);
      return Right(model);
    } catch (e) {
      debugPrint(e.toString());
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AlbumModel>> searchForAlbum(String q) async {
    try {
      Response response =
          await apiManager.getData('${EndPoints.search}?q=$q&type=album');
      AlbumModel model = AlbumModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      debugPrint(e.toString());
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryResponce>> getCategories() async {
    try {
      Response response = await apiManager.getData(EndPoints.categories);

      CategoryResponce model = CategoryResponce.fromJson(response.data);

      return Right(model);
    } catch (e) {
      debugPrint(e.toString());
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
