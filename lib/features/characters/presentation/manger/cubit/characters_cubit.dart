import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/domain/use_case/fatch_charaters_use_case.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.fatchCharatersUseCase) : super(CharactersInitial());
  final FatchCharatersUseCase fatchCharatersUseCase;

  Future<void> fetchCharaters() async {
    emit(CharactersLoading());
    var result = await fatchCharatersUseCase.call();
    result.fold((failure) {
      emit(CharactersFailure(errMessage: failure.errModel.errorMessage));
    }, (characters) {
      emit(CharactersSuccess(characters: characters));
    });
  }
}
