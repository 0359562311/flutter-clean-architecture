import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/identify_device_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/identify_device_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/identify_device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class IdentifyDeviceBloc extends Bloc<IdentifyDeviceEvent, IdentifyDeviceState>{
  IdentifyDeviceBloc() : super(IdentifyDeviceState.successful());

  final IdentifyDeviceUseCase _useCase = GetIt.instance<IdentifyDeviceUseCase>();

  @override
  Stream<IdentifyDeviceState> mapEventToState(IdentifyDeviceEvent event) async* {
    // TODO: implement mapEventToState
    if(event is IdentifyDeviceConfirmEvent){
      yield IdentifyDeviceState.loading();
      yield* (await _useCase.call(event.password)).fold(
          (r) async* {
            yield* _error(r);
          },
          (l) async* {
            yield* _success();
          }
      );
    }
  }

  Stream<IdentifyDeviceState> _error(Failure failure) async* {
    yield IdentifyDeviceState.error(failure.message);
  }

  Stream<IdentifyDeviceState> _success() async* {
    yield IdentifyDeviceState.successful();
  }

}