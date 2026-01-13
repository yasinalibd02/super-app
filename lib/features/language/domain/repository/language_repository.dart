import 'package:fpdart/fpdart.dart';
import 'package:flutter/material.dart';
import '../entities/language_entity.dart';

abstract class LanguageRepository {
  Future<Either<Exception, LanguageEntity>> getSavedLanguage();
  Future<Either<Exception, bool>> changeLanguage(Locale locale);
}
