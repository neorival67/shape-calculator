import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class RectangleEvent extends Equatable {
  const RectangleEvent();

  @override
  List<Object> get props => [];
}

class CalculateRectangleArea extends RectangleEvent {
  final double length;
  final double width;

  const CalculateRectangleArea({required this.length, required this.width});

  @override
  List<Object> get props => [length, width];
}

// States
abstract class RectangleState extends Equatable {
  const RectangleState();

  @override
  List<Object> get props => [];
}

class RectangleInitial extends RectangleState {}

class RectangleCalculated extends RectangleState {
  final double length;
  final double width;
  final double area;

  const RectangleCalculated({
    required this.length,
    required this.width,
    required this.area,
  });

  @override
  List<Object> get props => [length, width, area];
}

// BLoC
class RectangleBloc extends Bloc<RectangleEvent, RectangleState> {
  RectangleBloc() : super(RectangleInitial()) {
    on<CalculateRectangleArea>(_onCalculateArea);
  }

  void _onCalculateArea(
    CalculateRectangleArea event,
    Emitter<RectangleState> emit,
  ) {
    final area = event.length * event.width;
    emit(RectangleCalculated(
      length: event.length,
      width: event.width,
      area: area,
    ));
  }
}

