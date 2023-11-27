import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/domain/repositories/home_repo.dart';

import '../../data/models/playlists_model.dart';

class UserPlaylistsUseCase {
  UserPlaylistsUseCase(this.repo);
  HomeRepo repo;

  Future<Either<Failures, PlaylistModel>> call() => repo.getUserPlaylists();
}
