import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/list_schedule.dart';

abstract class ListClassState {
  const ListClassState();
}

class ListClassErrorState extends ListClassState{
  final String message;

  const ListClassErrorState(this.message);
}

class ListClassLoadingState extends ListClassState{
  const ListClassLoadingState();
}

class ListClassCompleteState extends ListClassState{
  final List<Classroom> classes;

  const ListClassCompleteState(this.classes);
}