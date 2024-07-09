part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent  extends Equatable{}

final class LoginUser extends AuthenticationEvent{
  final String email,password;
  LoginUser({required this.email,required this.password});
  @override
  List<Object?> get props => [email,password];
}

final class RegisterUser extends AuthenticationEvent{
  final String email,password,firstName,lastName,country, phoneNumber,userName ;
  RegisterUser({required this.email,required this.password, 
  required this.country,required this.firstName, 
  required this.lastName, required this.phoneNumber, 
  required this.userName});
  @override
  List<Object?> get props => [email,password, country,firstName,lastName, phoneNumber, userName];
}
