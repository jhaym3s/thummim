part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent  extends Equatable{}

final class LoginUser extends AuthenticationEvent{
  final String email,password;
  LoginUser({required this.email,required this.password});
  @override
  List<Object?> get props => [email,password];
}
