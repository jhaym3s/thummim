part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable{}

final class AuthenticationInitial extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class LoginLoadingState extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

final class LoginSuccessState extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

final class LoginFailureState extends AuthenticationState{
  final String errorMessage;
  LoginFailureState({required this.errorMessage});
  
  @override
  List<Object?> get props => [errorMessage];
}
