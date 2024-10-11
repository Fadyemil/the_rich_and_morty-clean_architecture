import 'package:hive/hive.dart';
part 'charaters_entities.g.dart';

@HiveType(typeId: 0)
class CharatersEntities {
  @HiveField(0)
  final String name;
   @HiveField(1)
  final String status;
   @HiveField(2)
  final String species;
   @HiveField(3)
  final String gender;
   @HiveField(4)
  final String locationName;
   @HiveField(5)
  final String image;

  CharatersEntities({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.locationName,
    required this.image,
  });
}
