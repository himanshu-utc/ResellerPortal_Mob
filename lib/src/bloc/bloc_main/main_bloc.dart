import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  String name = "Ram";

  MainBloc(super.initialState);



  Future tp() async {}

  @override
  MainState get initialState => MainInitial();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {}
}


