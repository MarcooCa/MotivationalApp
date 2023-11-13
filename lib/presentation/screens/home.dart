import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mi_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset('assets/homeimage.png',
            width: 350,
            height: 350,
            fit: BoxFit.cover),
          ),
          RichText(
            
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children:[
                TextSpan(text: 'Inspiración Diaria\n', style: GoogleFonts.oswald(fontSize: 20) ),
                TextSpan(text: 'Frases\n', style: GoogleFonts.dmSerifDisplay(fontSize: 50, fontWeight: FontWeight.bold) ),
                TextSpan(text: 'Motivacionales\n', style: GoogleFonts.dmSerifDisplay(fontSize: 50, fontWeight: FontWeight.bold) ),
                TextSpan(text: 'Descubre frases motivacionales, guardalas en tu dispositivo y compartelas con el mundo', style: GoogleFonts.oswald(fontSize: 20, color: Colors.grey))
              ] ),
          ),

          Center(
            child: ElevatedButton(
              style: buttonPrimary,
              onPressed: () => {context.push('/frasesmo')},
              child: const Text('Empezar',
              style: TextStyle(color: Colors.white),),
              ),
          )
        ],
      ),

    );
  }
}