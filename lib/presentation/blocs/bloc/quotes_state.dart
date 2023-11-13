import 'package:equatable/equatable.dart';

abstract class MotivationalState extends Equatable {
  const MotivationalState();

  @override
  List<Object> get props => [];
}

class MotivationalInitial extends MotivationalState {}

class MotivationalGenerated extends MotivationalState {
  final List<MotivationalItem> motivationalItems;

  const MotivationalGenerated(this.motivationalItems);

  @override
  List<Object> get props => [motivationalItems];
}

class MotivationalItem {
  final String imagePath;
  final String motivationalText;

  MotivationalItem(this.imagePath, this.motivationalText);
}
