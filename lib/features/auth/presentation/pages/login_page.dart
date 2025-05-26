// login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/utils/vibra_theme.dart';
import 'package:vibra/features/auth/presentation/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Bienvenido a Vibra',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: VibraColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tu mundo musical personalizado',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            authState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: () {
                      ref.read(authProvider.notifier).login(context);
                    },
                    icon: const Icon(Icons.music_note),
                    label: const Text(
                      'Iniciar sesión con Spotify',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VibraColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
