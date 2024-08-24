import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/shared_preference_manager.dart';
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
    final getToken = await authenticationService.getThimPressToken(email: event.email, password: event.password);
    getToken.fold((l) {
      print("first 1 $l ");
      emit(LoginFailureState(errorMessage: l));
    }, 
    (r) {
       print(r);
       SharedPreferencesManager.setString(PrefKeys.thimPressToken, r["token"]);
        //SharedPreferencesManager.setBool(PrefKeys.isFirstTime,false);
     user.fold((l) {
      print("first $l ");
       emit(LoginFailureState(errorMessage: l));
     }, 
    (r) {
       print(r);
       SharedPreferencesManager.setString(PrefKeys.accessToken,r["token"]);
       SharedPreferencesManager.setBool(PrefKeys.isFirstTime,false);
       //SharedPreferencesManager.setInt(PrefKeys.userId,r["user_id"]);
      emit(LoginSuccessState());
    });
    });
    
  }

  FutureOr<void> registerUser(RegisterUser event, Emitter<AuthenticationState> emit) async {
    emit(RegisterLoadingState());
    final user = await authenticationService.registerUser(email: event.email, password: event.password, firstName: event.firstName, lastName: event.lastName, country: event.country, userName: event.userName, phoneNumber: event.phoneNumber);
    user.fold((l) => emit(RegisterFailureState(errorMessage: l)), 
    (r) {
      print(r);
      emit(RegisterSuccessState());
    });
  }
}
