part of 'bottomnavbar_bloc.dart';

abstract class BottomNavBarState extends Equatable {
  final int pageIndex;
  final Widget pageWidget;
  const BottomNavBarState(this.pageIndex, this.pageWidget);

  @override
  List<Object> get props => [pageIndex, pageWidget];
}

class BottomNavBarInitial extends BottomNavBarState {
  BottomNavBarInitial(int pageIndex, Widget pageWidget)
      : super(pageIndex, pageWidget);
}

class BottomNavBarChanged extends BottomNavBarState {
  final int pageIndex;
  final Widget pageWidget;
  BottomNavBarChanged(this.pageIndex, this.pageWidget)
      : super(pageIndex, pageWidget);
}
