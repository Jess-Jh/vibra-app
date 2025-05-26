import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/router.dart';
import 'package:vibra/core/utils/secure_storage_helper.dart';
import 'package:vibra/features/auth/data/datasources/auth_romote_data_source.dart';

part 'auth_provider.g.dart';
part 'auth_provider.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  factory AuthState({
    @Default(false) bool isLoading,
    String? token,
    String? error,
  }) = _AuthState;
}

@riverpod
Future<AuthState> authToken(Ref ref) async {
  final savedToken = await SecureStorageHelper.getToken();
  return AuthState(token: savedToken);
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final _authRemoteDataSource = AuthRemoteDataSource();

  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> login(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final token = await _authRemoteDataSource.authenticate(context);
      await SecureStorageHelper.saveToken(token);
      state = AuthState(token: token);
      if (context.mounted) context.go(Routes.home);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> logout() async {
    await SecureStorageHelper.deleteToken();
    state = AuthState();
  }
}
