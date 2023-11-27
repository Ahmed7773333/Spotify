import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/Home%20layout/data/models/podcast_model.dart';

import '../../../../core/eror/failuers.dart';
import '../../data/models/album_model.dart';
import '../../data/models/categories_mode.dart';
import '../../data/models/new_song_model.dart';
import '../../data/models/playlists_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, PlaylistModel>> getUserPlaylists();
  Future<Either<Failures, NewSong>> getNewSongs();
  Future<Either<Failures, PodcastShow>> getPodcasts();
  Future<Either<Failures, AlbumModel>> searchForAlbum(String q);
  Future<Either<Failures, CategoryResponce>> getCategories();
}
