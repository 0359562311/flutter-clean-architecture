import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/user/update_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInformation getUserInformation;
  final UpdateUserProfile updateUserProfile;

  ProfileBloc(this.getUserInformation, this.updateUserProfile)
      : super(ProfileState.loading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield ProfileState.loading();
    if (event is GetProfileEvent) {
      yield* (await getUserInformation()).fold(
         (l) async* {
        yield ProfileState.error(l.message);
      }, (r) async* {
        GetIt.instance<HomeBloc>().add(HomeEvent.getUserInfor());
        yield ProfileState.complete(r);
      });
    } else if (event is UpdateProfileEvent) {
      yield* (await updateUserProfile(event.address, event.phoneNumber)).fold(
         (l) async* {
        yield ProfileState.error(l.message);
      }, (r) async* {
        yield ProfileState.complete(r);
      });
    }
  }
}
