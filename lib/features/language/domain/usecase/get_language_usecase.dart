import 'package:fpdart/fpdart.dart';
import '../entities/language_entity.dart';
import '../repository/language_repository.dart';

class GetLanguageUseCase {
  final LanguageRepository repository;

  GetLanguageUseCase(this.repository);

  Future<Either<Exception, LanguageEntity>> call() async {
    return await repository.getSavedLanguage();
  }
}
