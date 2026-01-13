import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final Locale locale;

  const LanguageEntity(this.locale);

  @override
  List<Object?> get props => [locale];
}
