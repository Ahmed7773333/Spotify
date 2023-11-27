import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/album_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/new_song_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/playlists_model.dart';
import 'package:spotify_app/features/Home%20layout/data/models/podcast_model.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_remote_ds_impl.dart';
import '../models/categories_mode.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDSImpl homeRemoteDSImpl;

  HomeRepoImpl(this.homeRemoteDSImpl);

  @override
  Future<Either<Failures, PlaylistModel>> getUserPlaylists() {
    return homeRemoteDSImpl.getUserPlayLists();
  }

  @override
  Future<Either<Failures, NewSong>> getNewSongs() {
    return homeRemoteDSImpl.getNewSongs();
  }

  @override
  Future<Either<Failures, PodcastShow>> getPodcasts() {
    return homeRemoteDSImpl.getPodcasts();
  }

  @override
  Future<Either<Failures, AlbumModel>> searchForAlbum(String q) {
    return homeRemoteDSImpl.searchForAlbum(q);
  }

  @override
  Future<Either<Failures, CategoryResponce>> getCategories() {
    return homeRemoteDSImpl.getCategories();
  }
}
