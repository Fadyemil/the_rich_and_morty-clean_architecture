part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersFailure extends CharactersState {
  final String errMessage;

  CharactersFailure({required this.errMessage});
}

class CharactersSuccess extends CharactersState {
  final List<CharatersEntities> characters;

  CharactersSuccess({required this.characters});
}
