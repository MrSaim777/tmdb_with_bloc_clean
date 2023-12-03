part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavTapped extends BottomNavEvent{
  final int selectedIndex;
  const BottomNavTapped({required this.selectedIndex});
}
