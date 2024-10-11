import 'package:dartz/dartz.dart';
import 'package:the_rich_and_morty/core/errors/failure.dart';

abstract class UseCase<type, Param> {
  Future<Either<Failure, type>> call([Param param]);
}