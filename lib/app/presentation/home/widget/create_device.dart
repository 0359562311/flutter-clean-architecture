import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/create_device_data_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/create_device_data_bloc.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/create_device_data_events.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/create_device_data_state.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CreateDeviceDialog extends StatefulWidget {
  const CreateDeviceDialog({Key? key}) : super(key: key);

  @override
  _CreateDeviceDialogState createState() => _CreateDeviceDialogState();
}

class _CreateDeviceDialogState extends State<CreateDeviceDialog> {
 late  final CreateDeviceDataBloc _bloc ;
 late CreateDeviceDataUseCase createDeviceDataUseCase;

 @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createDeviceDataUseCase = CreateDeviceDataUseCase(GetIt.instance<UserRepository>());
    _bloc = CreateDeviceDataBloc(createDeviceDataUseCase);
    String deviceId = PlatformInfo.deviceId;
    String deviceName = PlatformInfo.deviceName;
    DeviceData deviceData = DeviceData(id: 1, deviceId: deviceId, deviceName: deviceName);

    return BlocBuilder<CreateDeviceDataBloc, CreateDeviceDataState>(
      bloc: _bloc,
        builder: (context,state){
          if(state is CreateDeviceDataSuccessState)
            _bloc.add(CreateDeviceDataOnClickEvents(deviceId, deviceName));

          return  AlertDialog(
                content: Text('Success!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Close",
                      )
                  )
                ],
              );
        },
    );
  }
}
