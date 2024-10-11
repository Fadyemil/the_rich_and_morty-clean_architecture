import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_rich_and_morty/core/networking/api/dio_consumer.dart';
import 'package:the_rich_and_morty/features/characters/data/data_sourse/charaters_local_data_source.dart';
import 'package:the_rich_and_morty/features/characters/data/data_sourse/charaters_remote_data_source.dart';
import 'package:the_rich_and_morty/features/characters/data/repos/characters_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

  getIt.registerSingleton<CharactersRepoImpl>(
    CharactersRepoImpl(
      charatersRemoteDataSource:
          CharatersRemoteDataSourceImpl(api: getIt.get<DioConsumer>()),
      charatersLocalDataSource: CharatersLocalDataSourceImpl(),
    ),
  );
}
