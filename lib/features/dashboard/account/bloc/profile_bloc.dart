import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileService profileService;
  ProfileBloc({required this.profileService}) : super(ProfileInitial()) {
    on<GetUserProfile>(getUserProfile);
  }

  FutureOr<void> getUserProfile(GetUserProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final user = await profileService.getProfile();
    user.fold((l) => emit(ProfileFailureState(errorMessage: l)), 
    (r) {
      print(r);
      emit(ProfileSuccessState(name: "Ifiok"));
    });
  }
}
