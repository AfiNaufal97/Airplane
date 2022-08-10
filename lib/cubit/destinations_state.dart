part of 'destinations_cubit.dart';

@immutable
abstract class DestinationsState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DestinationsInitial extends DestinationsState {}

class DestinationsLoading extends DestinationsState {}

class DestinationsSuccess extends DestinationsState {
  final List<DestinationsModel> model;
  DestinationsSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class DestinationsError extends DestinationsState {
  String error;
  DestinationsError(this.error);

  @override
  List<Object?> get props => [error];
}
