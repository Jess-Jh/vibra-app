import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/features/search/data/datasource/spotify_api_service.dart';
import 'secure_storage_helper.dart';

final authStateProvider = StateProvider<bool>((ref) => true);

class SpotifyApiHelper {
  final Ref ref;

  SpotifyApiHelper(this.ref);

  Future<T> callWithAuth<T>(Future<T> Function(String token) action) async {
    final token = await SecureStorageHelper.getToken();

    if (token == null) {
      // No hay token guardado, usuario no está autenticado
      ref.read(authStateProvider.notifier).state = false;
      throw TokenExpiredException();
    }

    try {
      return await action(token);
    } on TokenExpiredException catch (_) {
      // Token expirado, cerrar sesión y actualizar estado
      await SecureStorageHelper.deleteToken();
      ref.read(authStateProvider.notifier).state = false;
      rethrow;
    }
  }
}
