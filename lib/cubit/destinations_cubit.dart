import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/services/destnation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void getFetchData() async {
    try {
      emit(DestinationsLoading());
      List<DestinationsModel> data = await DestinationsService().fetchData();
      emit(DestinationsSuccess(data));
    } catch (e) {
      emit(DestinationsError(e.toString()));
    }
  }
}
