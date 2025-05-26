import 'dart:ui';

import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/utils/message_dialog.dart';
import 'package:vibra/core/utils/vibra_theme.dart';
import 'package:vibra/features/detail/presentation/pages/widgets/animated_play_indicator.dart';
import 'package:vibra/features/detail/presentation/providers/album_tracks_provider.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

class DetailPage extends ConsumerWidget {
  final MusicItemModel item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAlbum = item.type == 'album';

    final AsyncValue<List<MusicItemModel>> tracksAsync = isAlbum
        ? ref.watch(albumTracksProvider(item.id))
        : const AsyncValue.data([]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(item.imageUrl ?? '', fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          SafeArea(child: _buildDetailContent(context, tracksAsync)),

          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildDetailContent(
    BuildContext context,
    AsyncValue<List<MusicItemModel>> tracksAsync,
  ) {
    final hasPreview = item.previewUrl != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 30),
            Hero(
              tag: item.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.imageUrl ?? '',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // TrackBox(item: item, width: double.infinity, height: 300),
            const SizedBox(height: 20),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: VibraColors.accent,
              ),
            ),
            if (item.subtitle != null)
              Text(
                item.subtitle!,
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
            const SizedBox(height: 60),

            // 🎵 Mostrar canciones del álbum si existen
            if (item.type == 'album')
              Expanded(
                child: tracksAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text('Error al cargar tracks del álbum: $e'),
                  data: (tracks) {
                    if (tracks.isEmpty) {
                      return const Text(
                        "Este álbum no contiene canciones disponibles.",
                      );
                    }
                    return ListView.builder(
                      itemCount: tracks.length,
                      itemBuilder: (_, index) {
                        final track = tracks[index];
                        return ListTile(
                          title: Text(
                            track.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            track.subtitle ?? '',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          trailing: track.previewUrl != null
                              ? const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                              : const Icon(Icons.block, color: Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),

            if (item.type != 'album')
              ElevatedButton.icon(
                onPressed: () {
                  if (hasPreview) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Reproduciendo '${item.name}'")),
                    );
                  } else {
                    Dialog.showTopMessage(
                      context: context,
                      message:
                          "Por el momento no se puede reproducir esta canción.",
                      backgroundColor: const Color.fromARGB(255, 168, 38, 36),
                    );
                  }
                },
                icon: AnimatedPlayIndicator(isPlaying: true),
                label: const Text("Reproducir Preview"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black38,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            Spacer(),
            const Text(
              "Inspirado en la experiencia de Spotify",
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
