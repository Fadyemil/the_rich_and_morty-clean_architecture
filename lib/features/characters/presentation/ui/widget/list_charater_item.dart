import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

class ListCharaterItem extends StatelessWidget {
  const ListCharaterItem({
    super.key,
    required this.chara,
  });
  final CharatersEntities chara;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 5,
      color: Colors.grey[900], // background card color
      child: Row(
        children: [
          //~ Image Section
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: chara.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          // Info Section
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //~ Character Name
                  AutoSizeText(
                    chara.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 4),

                  //~ Character Status and Species
                  AutoSizeText(
                    '${chara.status} - ${chara.species}',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),

                  //~ Last Known Location
                  const AutoSizeText(
                    'Last known location:',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  AutoSizeText(
                    chara.locationName,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 4),

                  // First Appearance
                  const AutoSizeText(
                    'First seen in:',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  AutoSizeText(
                    chara.gender,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
