import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

class CharatersModels extends CharatersEntities {
  final int? id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin? origin;
  final Origin? location;
  final String image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharatersModels({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    this.origin,
    this.location,
    required this.image,
    this.episode,
    this.url,
    this.created,
  }) : super(
          name: name,
          status: status,
          species: species,
          gender: gender,
          locationName: location?.name ?? 'Unknown',
          image: image,
        );

  // تحويل إلى factory method
  factory CharatersModels.fromJson(Map<String, dynamic> json) {
    return CharatersModels(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
      type: json['type'] ?? '',
      gender: json['gender'] ?? 'Unknown',
      origin: json['origin'] != null ? Origin.fromJson(json['origin']) : null,
      location: json['location'] != null ? Origin.fromJson(json['location']) : null,
      image: json['image'] ?? 'No image',
      episode: json['episode'] != null ? json['episode'].cast<String>() : [],
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}

class Origin {
  final String? name;
  final String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
