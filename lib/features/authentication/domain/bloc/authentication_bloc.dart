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
    on<RegisterUser>(registerUser);

  }

  FutureOr<void> loginUser(LoginUser event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());
    final user = await authenticationService.loginUser(email: event.email, password: event.password);
    user.fold((l) => emit(LoginFailureState(errorMessage: l)), 
    (r) => emit(LoginSuccessState()));
  }

  FutureOr<void> registerUser(RegisterUser event, Emitter<AuthenticationState> emit) async {
    emit(RegisterLoadingState());
    final user = await authenticationService.registerUser(email: event.email, password: event.password, firstName: event.firstName, lastName: event.lastName, country: event.country, userName: event.userName, phoneNumber: event.phoneNumber);
    user.fold((l) => emit(RegisterFailureState(errorMessage: l)), 
    (r) => emit(RegisterSuccessState()));
  }
}
