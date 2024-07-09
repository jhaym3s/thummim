part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

}


class GetUserProfile extends ProfileEvent{
  @override
  List<Object?> get props => [];
}


