import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class CubeEvent extends Equatable {
  const CubeEvent();

  @override
  List<Object> get props => [];
}

class CalculateCubeVolume extends CubeEvent {
  final double side;

  const CalculateCubeVolume({required this.side});

  @override
  List<Object> get props => [side];
}

// States
abstract class CubeState extends Equatable {
  const CubeState();

  @override
  List<Object> get props => [];
}

class CubeInitial extends CubeState {}

class CubeCalculated extends CubeState {
  final double side;
  final double volume;

  const CubeCalculated({
    required this.side,
    required this.volume,
  });

  @override
  List<Object> get props => [side, volume];
}

// BLoC
class CubeBloc extends Bloc<CubeEvent, CubeState> {
  CubeBloc() : super(CubeInitial()) {
    on<CalculateCubeVolume>(_onCalculateVolume);
  }

  void _onCalculateVolume(
    CalculateCubeVolume event,
    Emitter<CubeState> emit,
  ) {
    final volume = event.side * event.side * event.side;
    emit(CubeCalculated(
      side: event.side,
      volume: volume,
    ));
  }
}

