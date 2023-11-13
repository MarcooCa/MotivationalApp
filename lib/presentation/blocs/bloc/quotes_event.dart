import 'package:equatable/equatable.dart';

abstract class MotivationalEvent extends Equatable {
  const MotivationalEvent();

  @override
  List<Object> get props => [];
}

class GenerateMotivationalImage extends MotivationalEvent {}
