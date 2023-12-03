part of 'bottom_nav_bloc.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {
  final int index;
  const BottomNavInitial({required this.index});
}

class BottomNavSelected extends BottomNavState {
  final int index;

  const BottomNavSelected({required this.index});

  @override
  List<Object> get props => [index];
}
