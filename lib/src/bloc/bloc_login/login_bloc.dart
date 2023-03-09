import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool autoValidation = false;

  LoginBloc(LoginState initialState) : super(initialState);

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
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {}
}
