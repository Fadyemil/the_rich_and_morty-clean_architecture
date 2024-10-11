import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:the_rich_and_morty/core/function/build_error_snack_bar.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
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

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    log(widget.charater.length.toString());
    return ListView.builder(
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
