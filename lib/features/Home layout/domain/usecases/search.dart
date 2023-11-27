import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/album_model.dart';
import 'package:spotify_app/features/Home%20layout/domain/repositories/home_repo.dart';

class SearchUseCase {
  SearchUseCase(this.repo);
  HomeRepo repo;

  Future<Either<Failures, AlbumModel>> call(String q) => repo.searchForAlbum(q);
}
