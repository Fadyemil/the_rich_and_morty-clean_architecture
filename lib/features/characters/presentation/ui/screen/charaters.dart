// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rich_and_morty/core/function/build_error_snack_bar.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/presentation/manger/cubit/characters_cubit.dart';
import 'package:the_rich_and_morty/features/characters/presentation/ui/widget/list_charaters.dart';

class Charaters extends StatefulWidget {
  const Charaters({super.key});

  @override
  State<Charaters> createState() => _CharatersState();
}

class _CharatersState extends State<Charaters> {
  List<CharatersEntities> character = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CharactersCubit, CharactersState>(
      listener: (context, state) {
        if (state is CharactersSuccess) {
          character.addAll(state.characters);
        }
        if (state is CharactersFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is CharactersSuccess ||
            state is FeaturedCharactersPaginationFailure ||
            state is FeaturedCharactersPaginationLoading) {
          return ListCharaters(charater: character);
        } else if (state is CharactersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is CharactersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Text('Something went wrong');
        }
      },
    ));
  }
}
