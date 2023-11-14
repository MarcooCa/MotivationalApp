import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mi_app/models/motivational_quotes_info.dart';
import 'package:mi_app/models/motivational_quote.dart';
//import 'package:mi_app/presentation/widgets/widgets.dart';
import 'package:screenshot/screenshot.dart';
//import 'package:mi_app/presentation/widgets/motivational_card.dart';

class MotivationalScreen extends StatefulWidget {
  const MotivationalScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MotivationalScreenState createState() => _MotivationalScreenState();
}

class _MotivationalScreenState extends State<MotivationalScreen> {
  int _currentIndex = 0;

  ScreenshotController screenshotController = ScreenshotController();

  saveImageGallery(){
    screenshotController.capture().then((Uint8List? image){
      saveScreenshot(image!);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Imagen guardada en galeria')
      ),
      
    );
  }

  saveScreenshot(Uint8List bytes)async{
    final time = DateTime.now().toIso8601String()
    .replaceAll('.','-' )
    .replaceAll(':', '-');
    final name = "Captura: $time";
    await ImageGallerySaver.saveImage(bytes, name: name);


  }

  @override
  Widget build(BuildContext context) {
    MotivationalQuote quote = motivationalQuotes[_currentIndex];

    return Scaffold(
      appBar:AppBar(
        title: const Text(
        "Frase Motivacional",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        elevation: 0,
        centerTitle: true,
        ),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              quote.imagePath,
              fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.5, 1],
                    colors: [
                     Colors.orange.withAlpha(50),
                     Colors.orange.withAlpha(150),
                     Colors.orange.withAlpha(200),
                    ]

                  )
                ),

                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '"',
                      style: GoogleFonts.oswald( fontSize: 60 , fontWeight: FontWeight.w900, color: Colors.amberAccent),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.oswald( fontWeight: FontWeight.w700),
                        children: [

                          TextSpan(                        
                            text: '${quote.quote}\n',
                            style: const TextStyle(fontSize: 30)
                          ),

                          const TextSpan(                        
                             text: '\n',
                             style: TextStyle(fontSize: 20)
                          ),

                          TextSpan(
                            text: "Autor: ${quote.author}",
                            style: const TextStyle(fontSize: 16),
                          ),

                          const TextSpan(                        
                             text: '\n',
                             style: TextStyle(fontSize: 20)
                          ),
                        ]
                      ),
                    )
                  ],
                ) ,
              ),
          ],
        ),
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 9),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                     _currentIndex = (_currentIndex - 1 + motivationalQuotes.length) % motivationalQuotes.length;
                    });
              },
              elevation: 0,
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(width: 16), // Ajusta el espacio entre los botones según sea necesario
            FloatingActionButton(
              onPressed: () {
                saveImageGallery();
              },
              elevation: 0,
              child: const Icon(Icons.camera_alt_outlined),
              ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                     _currentIndex = (_currentIndex + 1) % motivationalQuotes.length;
                    });
              },
              elevation: 0,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
    );
  }
}