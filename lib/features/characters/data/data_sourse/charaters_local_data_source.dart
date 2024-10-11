import 'package:hive/hive.dart';
import 'package:the_rich_and_morty/core/constant/box_name.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

abstract class CharatersLocalDataSource {
  List<CharatersEntities> fetchCharaters();
}

class CharatersLocalDataSourceImpl extends CharatersLocalDataSource {
  @override
  List<CharatersEntities> fetchCharaters() {
    var box = Hive.box<CharatersEntities>(BoxName.kCharactersBox);
    return box.values.toList();
  }
}
