import 'package:dartz/dartz.dart';
import 'package:the_rich_and_morty/core/errors/failure.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/domain/repo/charaters_repo.dart';
import 'package:the_rich_and_morty/features/characters/domain/use_case/use_case.dart';

class FatchCharatersUseCase extends UseCase<List<CharatersEntities>, void> {
  final CharatersRepo charatersRepo;

  FatchCharatersUseCase({required this.charatersRepo});

  @override
  Future<Either<Failure, List<CharatersEntities>>> call([void param]) async {
    return await charatersRepo.fatchCharaters();
  }
}
