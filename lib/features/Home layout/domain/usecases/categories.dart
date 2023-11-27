import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/eror/failuers.dart';
import 'package:spotify_app/features/Home%20layout/data/models/categories_mode.dart';
import 'package:spotify_app/features/Home%20layout/domain/repositories/home_repo.dart';

class CategoriesUseCase {
  CategoriesUseCase(this.repo);
  HomeRepo repo;

  Future<Either<Failures, CategoryResponce>> call() => repo.getCategories();
}
