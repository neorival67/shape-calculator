import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math' as math;

// Events
abstract class CircleEvent extends Equatable {
  const CircleEvent();

  @override
  List<Object> get props => [];
}

class CalculateCircleArea extends CircleEvent {
  final double radius;

  const CalculateCircleArea({required this.radius});

  @override
  List<Object> get props => [radius];
}

// States
abstract class CircleState extends Equatable {
  const CircleState();

  @override
  List<Object> get props => [];
}

class CircleInitial extends CircleState {}

class CircleCalculated extends CircleState {
  final double radius;
  final double area;

  const CircleCalculated({
    required this.radius,
    required this.area,
  });

  @override
  List<Object> get props => [radius, area];
}

// BLoC
class CircleBloc extends Bloc<CircleEvent, CircleState> {
  CircleBloc() : super(CircleInitial()) {
    on<CalculateCircleArea>(_onCalculateArea);
  }

  void _onCalculateArea(
    CalculateCircleArea event,
    Emitter<CircleState> emit,
  ) {
    final area = math.pi * event.radius * event.radius;
    emit(CircleCalculated(
      radius: event.radius,
      area: area,
    ));
  }
}

