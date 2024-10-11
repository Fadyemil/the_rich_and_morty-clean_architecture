import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rich_and_morty/features/characters/presentation/manger/cubit/characters_cubit.dart';
import 'package:the_rich_and_morty/features/characters/presentation/ui/widget/list_charaters.dart';

class Charaters extends StatelessWidget {
  const Charaters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersSuccess) {
            return ListCharaters(
              charater: state.characters,
            );
          }
           else if (state is CharactersLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if (state is CharactersFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
