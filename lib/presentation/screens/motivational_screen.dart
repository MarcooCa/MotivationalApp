// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:mi_app/config/conexion/conexion_mongo.dart';
import 'package:mi_app/models/motivational_quote.dart';
import 'package:go_router/go_router.dart';

class MotivationalScreen extends StatefulWidget {
  const MotivationalScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MotivationalScreenState createState() => _MotivationalScreenState();
}

class _MotivationalScreenState extends State<MotivationalScreen> {
  late String apiKey;
  late bool isLoading;
  late MotivationalQuote quote = MotivationalQuote(quote: '', author: '');
  late Uint8List currentImageBytes;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    obtenerApiKey();
  }

  Future<void> obtenerApiKey() async {
    try {
      apiKey = await MongoDbProvider.obtenerAPIKey();
      await fetchRandomQuoteAndImage();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error al obtener la clave de API: $e');
    }
  }

  Future<Uint8List> fetchRandomImage() async {
    final response = await http.get(Uri.parse('https://picsum.photos/1080/2400'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }


  
  Future<void> fetchRandomQuote() async {
    try {
      final responseQuote = await http.get(Uri.parse('https://api.quotable.io/random'));

      if (responseQuote.statusCode == 200) {
        final Map<String, dynamic> quoteData = json.decode(responseQuote.body);
        final quoteText = quoteData['content'];

        const apiUrl = 'https://api-free.deepl.com/v2/translate';
        final responseTranslate = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: {
            'auth_key': apiKey,
            'text': quoteText.toString(),
            'target_lang': 'ES',
          },
        );

        if (responseTranslate.statusCode == 200) {
          const encoding = Utf8Codec();
          final Map<String, dynamic> translationData = json.decode(encoding.decode(responseTranslate.bodyBytes));
          final translatedText = translationData['translations'][0]['text'].toString();

          setState(() {
            quote = MotivationalQuote(quote: translatedText, author: quoteData['author']);
          });
        } else {
          print('Error al traducir la cita: ${responseTranslate.statusCode}');
        }
      } else {
        print('Error al obtener la cita: ${responseQuote.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //Esta funcion junta o ejecuta la funcion de frase aleatoria e imagen aleatoria
  Future<void> fetchRandomQuoteAndImage() async {
    setState(() {
      isLoading = true; // Muestra el indicador de carga
    });

    try {
      final newImageBytes = await fetchRandomImage();
      await fetchRandomQuote();
      setState(() {
        currentImageBytes = newImageBytes;
        isLoading = false; // Oculta el indicador de carga
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  saveImageGallery() {
    screenshotController.capture().then((Uint8List? image) {
      saveScreenshot(image!);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Imagen guardada en galeria')),
    );
  }

  saveScreenshot(Uint8List bytes) async {
    final time = DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
    final name = "Captura: $time";
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Frase Motivacional",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), 
            onPressed: () => {context.push('/perfil')},
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(
             ))
          : buildMotivationalQuoteScreen(),
      floatingActionButton: isLoading ? null : buildFloatingActionButtons(),
    );
  }

  Widget buildMotivationalQuoteScreen() {
    return Screenshot(
      controller: screenshotController,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.memory(
            currentImageBytes,
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
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '"',
                  style: GoogleFonts.oswald(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.amberAccent),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.oswald(fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: '${quote.quote}\n', style: const TextStyle(fontSize: 30)),
                      const TextSpan(text: '\n', style: TextStyle(fontSize: 20)),
                      TextSpan(text: "Autor: ${quote.author}", style: const TextStyle(fontSize: 16)),
                      const TextSpan(text: '\n', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 9),
        FloatingActionButton(
          onPressed: () async {
            final imageBytes = await screenshotController.capture();
            final directory = (await getTemporaryDirectory()).path;
            final imagePath = '$directory/screenshot.png';
            File(imagePath).writeAsBytesSync(imageBytes!);
            // ignore: deprecated_member_use
            Share.shareFiles([imagePath], text: 'Compartir captura de pantalla');
          },
          elevation: 0,
          heroTag: 'share_button',
          child: const Icon(Icons.share),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () {
            saveImageGallery();
          },
          elevation: 0,
          heroTag: 'camera_button',
          child: const Icon(Icons.camera_alt_outlined),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () {
            fetchRandomQuoteAndImage();
          },
          elevation: 0,
          heroTag: 'forward_button',
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
