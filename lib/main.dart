import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_rich_and_morty/core/cache/cache.dart';
import 'package:the_rich_and_morty/core/constant/box_name.dart';
import 'package:the_rich_and_morty/core/di/dependency_injection.dart';
import 'package:the_rich_and_morty/core/utils/bloc_observer.dart';
import 'package:the_rich_and_morty/features/characters/data/repos/characters_repo_impl.dart';
import 'package:the_rich_and_morty/features/characters/domain/entities/charaters_entities.dart';
import 'package:the_rich_and_morty/features/characters/domain/use_case/fatch_charaters_use_case.dart';
import 'package:the_rich_and_morty/features/characters/presentation/manger/cubit/characters_cubit.dart';
import 'package:the_rich_and_morty/features/characters/presentation/ui/screen/charaters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  await Hive.initFlutter();
  Hive.registerAdapter(CharatersEntitiesAdapter());
  setupServiceLocator();
  await Hive.openBox<CharatersEntities>(BoxName.kCharactersBox);
  Bloc.observer = BlocObs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(
        FatchCharatersUseCase(
          charatersRepo: getIt.get<CharactersRepoImpl>(),
        ),
      )..fetchCharaters(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Charaters(),
      ),
    );
  }
}
