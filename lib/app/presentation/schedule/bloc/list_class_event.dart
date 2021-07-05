abstract class ListClassEvent{}

class ListClassFetchAllEvent extends ListClassEvent{}

class ListClassFilterEvent extends ListClassEvent{
  final int week;

  ListClassFilterEvent(this.week);
}