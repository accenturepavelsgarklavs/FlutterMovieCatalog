import '../repositories/saved_movies_repository.dart';

class DeleteSavedMovie {
  final SavedMoviesRepository _repository;

  DeleteSavedMovie({required repository}) : _repository = repository;

  Future<void> delete(int? id) async {
    return await _repository.deleteData(id!);
  }
}
