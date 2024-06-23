import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:thummim/features/authentication/domain/services/authentication_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authenticationService;
  AuthenticationBloc({required this.authenticationService}) : super(AuthenticationInitial()) {
    on<LoginUser>(loginUser);
  }

  FutureOr<void> loginUser(LoginUser event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());
    final user = await authenticationService.loginUser(email: event.email, password: event.password);
    user.fold((l) => emit(LoginFailureState(errorMessage: l)), 
    (r) => emit(LoginSuccessState()));
  }
}
