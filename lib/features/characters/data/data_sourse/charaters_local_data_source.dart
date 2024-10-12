import 'package:hive/hive.dart';
import 'package:the_rich_and_morty/core/constant/box_name.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

abstract class CharatersLocalDataSource {
  List<CharatersEntities> fetchCharaters({int pageNumber = 0});
}

class CharatersLocalDataSourceImpl extends CharatersLocalDataSource {
  @override
  List<CharatersEntities> fetchCharaters({int pageNumber = 0}) {
    int startIndex = pageNumber * 20;
    int endIndex = (pageNumber + 1) * 20;

    var box = Hive.box<CharatersEntities>(BoxName.kCharactersBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }
}
//  @override
//   List<CharatersEntities> fetchCharaters() {
//     var box = Hive.box<CharatersEntities>(BoxName.kCharactersBox);
//     return box.values.toList();
//   }