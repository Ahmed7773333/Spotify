import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/podcast_model.dart';
import 'package:spotify_app/features/Home%20layout/domain/repositories/home_repo.dart';

class PodcastsUseCase {
  PodcastsUseCase(this.repo);
  HomeRepo repo;

  Future<Either<Failures, PodcastShow>> call() => repo.getPodcasts();
}
