import 'package:dartz/dartz.dart';
import 'package:the_rich_and_morty/core/errors/failure.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';

abstract class CharatersRepo {
  Future<Either<Failure, List<CharatersEntities>>> fatchCharaters({int pageNumber=0});
}
