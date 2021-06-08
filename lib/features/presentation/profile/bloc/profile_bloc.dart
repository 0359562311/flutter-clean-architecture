import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/profile/get_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/profile/update_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
        GetIt.instance<HomeBloc>().add(HomeEvent.getUserInfor());
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
