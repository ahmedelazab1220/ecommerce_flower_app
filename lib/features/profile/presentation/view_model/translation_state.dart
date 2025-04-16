import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TranslationState extends Equatable {
  final Locale? currentLocale;

  const TranslationState({this.currentLocale});

  TranslationState copyWith({Locale? currentLocale}) {
    return TranslationState(currentLocale: currentLocale ?? this.currentLocale);
  }

  @override
  List<Object?> get props => [currentLocale];
}
