part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}


final class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

final class ProfileSuccessState extends ProfileState {
  final String name;
  const ProfileSuccessState({required this.name});
  @override
  List<Object?> get props => [name];
}

final class ProfileFailureState extends ProfileState {
  final String errorMessage;
  ProfileFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [];
}

