import 'package:hive/hive.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

void saveCharatersData(List<CharatersEntities> books, String boxName) {
  var box = Hive.box<CharatersEntities>(boxName);
  box.addAll(books);
}
