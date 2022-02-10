part of 'bottomnavbar_bloc.dart';

abstract class BottomNavBarState extends Equatable {
  final int pageIndex;
  final Widget pageWidget;
  const BottomNavBarState(this.pageIndex, this.pageWidget);

  @override
  List<Object> get props => [pageIndex, pageWidget];
}

class BottomnavbarInitial extends BottomNavBarState {
  BottomnavbarInitial(int pageIndex, Widget pageWidget)
      : super(pageIndex, pageWidget);
}

class BottomnavbarChanged extends BottomNavBarState {
  final int pageIndex;
  final Widget pageWidget;
  BottomnavbarChanged(this.pageIndex, this.pageWidget)
      : super(pageIndex, pageWidget);
}
