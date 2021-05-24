import 'package:flutter_app_clean_architecture/features/profile/domain/use%20cases/get_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/use%20cases/update_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfile getUserProfile;
  final UpdateUserProfile updateUserProfile;

  ProfileBloc(this.getUserProfile, this.updateUserProfile)
      : super(ProfileState.loading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield ProfileState.loading();
    if (event is GetProfileEvent) {
      yield* (await getUserProfile()).fold(
         (l) async* {
        yield ProfileState.error(l.message);
      }, (r) async* {
        yield ProfileState.complete(r);
      });
    } else if (event is UpdateProfileEvent) {
      yield* (await updateUserProfile(event.profile)).fold(
         (l) async* {
        yield ProfileState.error(l.message);
      }, (r) async* {
        yield ProfileState.complete(r);
      });
    }
  }
}
