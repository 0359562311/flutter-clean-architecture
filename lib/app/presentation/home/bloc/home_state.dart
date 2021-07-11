import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
abstract class HomeState{
}

class HomeSuccessfulState extends HomeState {
  final CustomUser customUser;
  HomeSuccessfulState(this.customUser);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}

class HomeLoadingState extends HomeState{}