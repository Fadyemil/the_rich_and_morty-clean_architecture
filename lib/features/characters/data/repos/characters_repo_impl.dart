import 'package:dartz/dartz.dart';
import 'package:the_rich_and_morty/core/errors/failure.dart';
import 'package:the_rich_and_morty/features/characters/data/data_sourse/charaters_local_data_source.dart';
import 'package:the_rich_and_morty/features/characters/data/data_sourse/charaters_remote_data_source.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/domain/repo/charaters_repo.dart';

class CharactersRepoImpl extends CharatersRepo {
  final CharatersRemoteDataSource charatersRemoteDataSource;
  final CharatersLocalDataSource charatersLocalDataSource;

  CharactersRepoImpl(
      {required this.charatersRemoteDataSource,
      required this.charatersLocalDataSource});

  @override
  Future<Either<Failure, List<CharatersEntities>>> fatchCharaters(
      {int pageNumber = 0}) async {
    List<CharatersEntities> charaters;
    try {
      charaters = charatersLocalDataSource.fetchCharaters(pageNumber: pageNumber);
      if (charaters.isNotEmpty) {
        return right(charaters);
      }
      charaters = await charatersRemoteDataSource.fetchCharaters(pagenumber: pageNumber);
      return Right(charaters);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
