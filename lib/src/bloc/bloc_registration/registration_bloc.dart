import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  bool autoValidation = false;

  RegistrationBloc(RegistrationState initialState) : super(initialState);

  //onLoginClick
  Future<bool> onLoginClick(final formKey) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      return true;
    } else {
      autoValidation = true;
      return false;
    }
  }
  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(
      RegistrationEvent event,
  ) async* {}
}
