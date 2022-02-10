part of 'bottomnavbar_bloc.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class TabChangedEvent extends BottomNavBarEvent {
  final index;
  final page;
  TabChangedEvent({@required this.index, @required this.page});
  @override
  List<Object> get props => [index];
}
