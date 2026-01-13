import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../repository/language_repository.dart';

class ChangeLanguageUseCase {
  final LanguageRepository repository;

  ChangeLanguageUseCase(this.repository);

  Future<Either<Exception, bool>> call(Locale locale) async {
    return await repository.changeLanguage(locale);
  }
}
