import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileState extends Equatable {
  final ThemeMode themeMode;
  final String languageCode;
  final bool isLoading;

  const ProfileState({
    this.themeMode = ThemeMode.system,
    this.languageCode = 'en',
    this.isLoading = false,
  });

  ProfileState copyWith({
    ThemeMode? themeMode,
    String? languageCode,
    bool? isLoading,
  }) {
    return ProfileState(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [themeMode, languageCode, isLoading];
}
