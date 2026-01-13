import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/entities/language_entity.dart';
import '../../domain/repository/language_repository.dart';
import '../datasource/language_local_datasource.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource localDataSource;

  LanguageRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Exception, bool>> changeLanguage(Locale locale) async {
    try {
      await localDataSource.saveLanguage(locale.languageCode);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, LanguageEntity>> getSavedLanguage() async {
    try {
      final languageCode = await localDataSource.getSavedLanguage();
      if (languageCode != null) {
        return Right(LanguageEntity(Locale(languageCode)));
      } else {
        return const Right(LanguageEntity(Locale('en'))); // Default
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
