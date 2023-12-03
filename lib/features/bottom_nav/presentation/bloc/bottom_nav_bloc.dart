import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, int> {
  BottomNavBloc() : super(0) {
    on<BottomNavTapped>((event, emit) {
      emit(event.selectedIndex);
    });
  }

  onTap(int index) {
    add(BottomNavTapped(selectedIndex: index));
  }
}
