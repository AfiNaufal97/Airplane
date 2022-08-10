import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void chooseSeat(String id) {
    // cek id before add
    if (setSeat(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print(state);
    emit(List.from(state));
  }

  bool setSeat(String id) {
    var idSeat = state.indexOf(id);
    if (idSeat == -1) {
      return true;
    } else {
      return false;
    }
  }
}
