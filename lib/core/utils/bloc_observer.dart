import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObs extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    log('Cubit: ${bloc.runtimeType}, Change: ${change.toString()}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Bloc: ${bloc.runtimeType} is closed');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Bloc: ${bloc.runtimeType}, Error: $error, StackTrace: $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('Bloc: ${bloc.runtimeType}, Transition: $transition');
  }
}
