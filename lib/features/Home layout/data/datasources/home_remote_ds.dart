import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/album_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/categories_mode.dart';
import 'package:spotify_app/features/Home%20layout/data/models/playlists_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/podcast_model.dart';

import '../models/new_song_model.dart';

abstract class HomeRemoteDS {
  Future<Either<Failures, PlaylistModel>> getUserPlayLists();
  Future<Either<Failures, NewSong>> getNewSongs();
  Future<Either<Failures, PodcastShow>> getPodcasts();
  Future<Either<Failures, AlbumModel>> searchForAlbum(String q);
  Future<Either<Failures, CategoryResponce>> getCategories();
}
