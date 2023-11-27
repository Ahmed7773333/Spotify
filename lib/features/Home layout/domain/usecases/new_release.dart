import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/domain/repositories/home_repo.dart';

import '../../data/models/new_song_model.dart';

class NewReleaseUseCase {
  NewReleaseUseCase(this.repo);
  HomeRepo repo;

  Future<Either<Failures, NewSong>> call() => repo.getNewSongs();
}
