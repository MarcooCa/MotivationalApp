import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'quotes_event.dart';
import 'quotes_state.dart';


class MotivationalBloc extends Bloc<MotivationalEvent, MotivationalState> {
  MotivationalBloc() : super(MotivationalInitial());

  Stream<MotivationalState> mapEventToState(MotivationalEvent event) async* {
    if (event is GenerateMotivationalImage) {
      final motivationalItems = generateMotivationalItems();
      yield MotivationalGenerated(motivationalItems);
    }
  }

  List<MotivationalItem> generateMotivationalItems() {
    // Lógica para generar la lista de imágenes y frases motivacionales
    return [
      MotivationalItem('assets/image1.jpeg', 'Frase 1'),
      MotivationalItem('assets/image2.jpeg', 'Frase 2'),
      // Agrega más elementos según sea necesario
    ];
  }
}