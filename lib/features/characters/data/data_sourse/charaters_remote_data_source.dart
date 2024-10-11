import 'dart:developer';

import 'package:the_rich_and_morty/core/constant/box_name.dart';
import 'package:the_rich_and_morty/core/function/save_books.dart';
import 'package:the_rich_and_morty/core/networking/api/api_consumer.dart';
import 'package:the_rich_and_morty/core/networking/api/end_ponits.dart';
import 'package:the_rich_and_morty/features/characters/data/models/charaters_models.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

abstract class CharatersRemoteDataSource {
  Future<List<CharatersEntities>> fetchCharaters();
}

class CharatersRemoteDataSourceImpl extends CharatersRemoteDataSource {
  final ApiConsumer api;

  CharatersRemoteDataSourceImpl({required this.api});

  @override
  Future<List<CharatersEntities>> fetchCharaters() async {
    var data = await api.get(EndPoint.character);

    List<CharatersEntities> characters = getCharactersList(data);
    saveCharatersData(characters, BoxName.kCharactersBox);
    return characters;
  }

  List<CharatersEntities> getCharactersList(Map<String, dynamic> data) {
    List<CharatersEntities> characters = [];

    // // تأكد من أن المفتاح 'results' يحتوي على بيانات
    // if (data.containsKey('results')) {
    for (var characterMap in data['results']) {
      characters.add(CharatersModels.fromJson(characterMap));
    }
    // }
    log('Number of characters fetched: ${characters.length}');
    return characters;
  }
}
