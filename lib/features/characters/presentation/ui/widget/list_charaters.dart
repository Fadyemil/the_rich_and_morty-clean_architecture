import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:the_rich_and_morty/core/function/build_error_snack_bar.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/presentation/manger/cubit/characters_cubit.dart';
import 'package:the_rich_and_morty/features/characters/presentation/ui/widget/list_charater_item.dart';
// import 'package:the_rich_and_morty/features/characters/presentation/ui/widget/list_charater_item.dart';

class ListCharaters extends StatefulWidget {
  const ListCharaters({
    super.key,
    required this.charater,
  });
  final List<CharatersEntities> charater;

  @override
  State<ListCharaters> createState() => _ListCharatersState();
}

class _ListCharatersState extends State<ListCharaters> {
  bool isLoading = true;

  late final ScrollController _scrollController;

  var nextPage = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();

    // Simulate data loading
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (widget.charater.isNotEmpty) {
          isLoading = false;
        } else {
          isLoading = false;
          buildErrorWidget("No characters found");
        }
      });
    });
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<CharactersCubit>(context)
            .fetchCharaters(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log(widget.charater.length.toString());
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.charater.length,
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: isLoading,
          child: ListCharaterItem(
            chara: widget.charater[index],
          ),
        );
      },
    );
  }
}
