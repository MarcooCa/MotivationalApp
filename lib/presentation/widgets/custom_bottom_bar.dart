import 'package:flutter/material.dart';


class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.arrow_back_ios),
          label: 'Anterior'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.camera_alt_outlined),
          label: 'Guardar'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.arrow_forward_ios),
          label: 'Siguiente'
        ),

      ],
    );
  }
}