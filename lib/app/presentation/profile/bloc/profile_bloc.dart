import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/update_user_profile.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/app/presentation/profile/bloc/profile_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInformationUseCase getUserInformation;
  final UpdateUserProfileUseCase updateUserProfile;

  ProfileBloc(this.getUserInformation, this.updateUserProfile)
      : super(ProfileState.loading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield ProfileState.loading();
    try {
      if (event is GetProfileEvent) {
        var user = await getUserInformation.call();
        yield ProfileState.complete(user);
      } else if (event is UpdateProfileEvent) {
        var user = (await updateUserProfile(event.address, event.phoneNumber));
        yield ProfileState.complete(user);
      }
    } on DioError catch (e) {
      // TODO
      yield ProfileState.error(e.message);
    }
  }
}
