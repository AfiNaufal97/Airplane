import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  set replacePage(int value) {
    emit(value);
  }
}
