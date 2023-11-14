# MotivationalApp

_Motivación en frases cortas para inspirar tu día._

## Equipo

- Marco Cancino -  Desarrollador Principal 
- Benjamin Bustamante - Arquitecto De Software
- Sergio Retamal - Encargado De Diseño

## Caso de uso

A diario las personas buscan algún tipo de motivación que les permita empezar su día de mejor manera, MotivationalApp nace para impulsar un comienzo positivo del día con un mensaje para elevar el ánimo y comenzar mejor la jornada. Con el surgimiento de las nuevas tecnologías muchas personas comparten inspiración a través de sus redes sociales se ha vuelto clave para la salud mental y para simplificar esta tarea la aplicación permite que se descargue la imágen al dispositivo con el mensaje, el autor y un fondo vibrante. _¡Motiva y comparte para inspirar a muchos más!"_

## Tecnologías utilizadas

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![PubspecAssist](https://img.shields.io/badge/Pubspec_Assist-2.3.2-0078d7?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Screenshot](https://img.shields.io/badge/Screenshot-2.1.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![ImageGallerySaver](https://img.shields.io/badge/Image_Gallery_Saver-2.0.3-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![GoRouter](https://img.shields.io/badge/Go_Router-12.1.1-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![GoogleFonts](https://img.shields.io/badge/Google_Fonts-6.1.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)

### Características a implementar
Con el fin de explicar el funcionamiento de la aplicación se describe el uso de los Widgets seleccionados a continuación:

- El uso del Widget [Screenshot](https://pub.dev/packages/screenshot) nos permitirá capturar el mensaje y fondo a través de una imagen.
- El uso del Widget [ImageGallerySaver](https://pub.dev/packages/image_gallery_saver) nos permitirá guardar en la galería de nuestro dispositivo la imagen capturada anteriormente.
- El uso del Widget [GoRouter](https://pub.dev/packages/go_router) nos permitirá navegar entre las diferentes pantallas de la aplicación
- El uso del Widget [GoogleFonts](https://pub.dev/packages/google_fonts) nos permitirá el uso de diversas fuentes, con el fin de hacer la aplicación más amigable a la vista. 

## Diseño
Nos enfocamos en ofrecer una experiencia única y positiva a través de un diseño cautivador y contenidos que impulsen la motivación. Para lograr esto, consideraremos los siguientes aspectos:

- Se utilizan colores calidos y alegres como lo son las variantes de Orange por propiedades vigorizante.
- Se seleccionarán tipografías de fácil entendimiento y tamaños de acuerdo con el color de cada imagen.
- Se imitan estucturas de texto y botones para posteriores acciones por parte del usuario.


### Diseño Inspirado
Para la construción de los aspectos visuales de la aplicación, se tomo en cuenta  un mockup de la siguente web, [Dribbble](https://dribbble.com/shots/popular).
En la cual se obtuvo el siguiente diseño:

![Diseño Inspirado](/assets/diseño_inspirado.jpeg)


### Pantalla Principal
a través del mockup visto anteriormente, se realizo el diseño de la *Pantalla Principal* al ingresar en la aplicación:

![Pantalla Principal de la App](/assets/pantalla_principal2.jpg)


### Pantalla de Frases
Después, se tiene el flujo a la siguiente pantalla, en la cual podemos ver la *Pantalla de Frases*, con **frase motivacional** y **autor** , más acciones que ofrece la aplicación.

![Pantalla Frases de la App](/assets/pantalla_frases2.jpg)



## Implementación

Teniendo en cuenta que estamos ocupando `Visual Studio Code` pues instalaremos una extensión que nos permitirá implementar la característica de una forma más cómoda y rápida. 
La extensión es Pubspec Assist, con ella fácilmente podemos añadir dependencias en `Dart` y `Flutter`.

![Pubspec](https://github.com/MarcooCa/MotivationalApp/assets/77038426/5458c56e-d1d8-4d54-92b5-dc234585ca48)

Para implementar la característica añadiremos las siguientes dependencias: `screenshot` e `image_gallery_saver`.  Presionando `Ctrl+Shift+P` en `VisualStudio Code` y escribiendo Pubspect Assit: `Add/update dependencies`, podemos agregar las anteriores dependencias de manera fácil y rápida. 

Pasando a la implementación en sí, el proyecto está estructurado en diferentes carpetas que serían las diferentes capas de la arquitectura. Para que la generación de imágenes con widgets en la aplicación funciones, primeramente, se definió dentro de la carpeta models, un modelo de datos que define la Frase Motivacional, es decir está la `quote`, el `autor` y la `imagePath`, por lo que en este momento la información necesaria para construir la parte visual de la imagen está de manera local y se hace referencia al dentro de la carpeta models también en un archivo diferente que hace import del modelo principal. 

```
class MotivationalQuote { 
  String quote; 
  String author; 
  String imagePath;
 
  MotivationalQuote({required this.quote, required this.author, required this.imagePath}); 

} 
```

Dentro de la carpeta config, se almacenan los archivos de ruta y la configuración del tema principal de la app. En el archivo enrutador `app_router.dart` a través de un widget `GoRouter` (dependencia go_router), se configuran las rutas a las diferentes pantallas.

```
final appRouter = GoRouter( 
  initialLocation: '/', 
  routes: [ 
    GoRoute( 
      path: '/', 
      builder: (context, state) => const HomeScreen(), 
      ), 
    GoRoute( 
      path: '/frasesmo', 
      builder: (context, state) => const MotivationalScreen(), 
    ) 
  ] 
); 
```

Es decir, tenemos una localización inicial que haría referencia a la pantalla HomeScreen `(archivo home.dart)` y otra ruta que nos llevaría a la pantalla en la que se encuentra la implementación de la característica principal y la que nos vamos a centrar `(archivo motivational_screen.dart)`.

Dentro de otra carpeta llamada `Presentation` se encuentran las diferentes pantallas de la app y también algunos widgets personalizados. La implementación de la característica de generación de imágenes con widgets se encuentra en la pantalla `MotivationalScreen`. Primeramente, tenemos la clase `MotivationalScreen` y constructor constante. Posteriormente se crea la clase `_MotivationalScreenState`, dentro de esta clase se implementa las diferentes `“mutaciones”` o cambios de la pantalla. 

```
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
```

Dentro de esta clase se declara `_currentIndex` que sirve para rastrear el índice de la frase motivacional actual en la lista de datos que importaba el modelo principal.
Se crea la instancia de `ScreenshotController` para después poder usar el widget y poder capturar pantalla y se crean las funciones `saveImageGallery` y `saveScreenshot`, una hace la captura a través de `screenshotController.capture()` que devuelve la lista de bytes si es exitosa la captura antes de llamar a la otra función que guarda la imagen en galería a través de `ImageGallerySaver.saveImage`.
Luego se empieza a construir la interfaz de la pantalla. 

```
@override 
  Widget build(BuildContext context) { 
    MotivationalQuote quote = motivationalQuotes[_currentIndex]; 
```

El `MotivationalQuote quote`, permite obtener la cita (frase, autor, imagen) utilizando el índice `_currentIndex`.

La estructura de la pantalla se realizó dentro de un `Scaffold`, donde se creó un `AppBar` para tener una barra en la parte de arriba. 
Se define el cuerpo de la pantalla “encerrando” los widgets que serán capturados a través de Screenshot. Dentro del Screenshot se utiliza el Stack para superponer los widgets en diferentes capas ya que tendremos el fondo que será la imagen y la frase junto a su autor en el frente 
Todo el Stack se centra y dentro de sus hijos a través del widget Image podemos hacer llamado a la imagen de fondo `(quote.ImagePath)` según el index correspondiente. 

```
Image.asset( 
              quote.imagePath, 
              fit: BoxFit.cover, 
              ), 
```

También se agregó un `container` donde se implementó un gradiente para decoración sobre la imagen. Posteriormente se agregó una Column donde se usó `RichText` para manejar las quotes y los authors según el index tambien.

```
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
```

Por fuera del Screenshot se implementan los tres `FloatingActionButton` dentro de una fila que permiten navegar a través de las diferentes frases.

```
FloatingActionButton( 
              onPressed: () { 
                setState(() { 
                     _currentIndex = (_currentIndex - 1 + motivationalQuotes.length) % motivationalQuotes.length; 
                    }); 
              }, 
              elevation: 0, 
              child: const Icon(Icons.arrow_back_ios), 
            ),
```

El primero de la fila permite retroceder, cuando se presiona, actualiza el estado de la clase, se calcula el nuevo índice en `_cuttentIndex` restándole 1 al actual para pasar a un índice anterior y si se encuentra en 0 vuelve al último índice de la lista. Así según el índice se muestra la frase motivacional correspondiente. 

```
FloatingActionButton( 
              onPressed: () { 
                saveImageGallery(); 
              }, 
              elevation: 0, 
              child: const Icon(Icons.camera_alt_outlined), 
              ), 
```

Luego tenemos el segundo `FloatingActionButton` de la fila que al presionarlo manda a llamar a la función `saveImageGallery` que se había creado y de esa forma se captura la imagen del stack y se guarda en galería. 

```
FloatingActionButton( 
              onPressed: () { 
                setState(() { 
                     _currentIndex = (_currentIndex + 1) % motivationalQuotes.length; 
                    }); 
              }, 
              elevation: 0, 
              child: const Icon(Icons.arrow_forward_ios), 
            ), 
```

Y el último de la fila realiza algo parecido al primero solamente que calcula el nuevo índice sumándole 1 para pasar al siguiente. Ahora si está en el último índice este avanzará al primero de la lista.


## Arquitectura

La arquitectura por capas en Flutter sigue un enfoque organizado y modular. Se describe a continuación la estructura del proyecto:

### Capa de Configuración:


- **Carpeta**: config
  
> Subcarpetas y archivos relacionados con la configuración de la aplicación. Contiene archivos de configuración, como app_router.dart para la gestión de rutas y app_theme.dart para la configuración del tema de la aplicación.

### Capa de Modelos:

- **Carpeta**: models

> Definiciones de modelos de datos utilizados en la aplicación. Contiene el modelo FraseMotivacional con propiedades como quote, author e imagePath.

### Capa de Datos:

- **Carpeta**: models

> Manejo de datos para los modelos definidos en la capa de modelos. Contiene un archivo que gestiona la obtención y manipulación de datos relacionados con las frases motivacionales.

### Capa de Presentación:

- **Carpeta**: presentation

> Subcarpetas y archivos que representan las diferentes pantallas de la aplicación y los widgets personalizados utilizados en la interfaz de usuario. Contiene carpetas para cada pantalla de la aplicación, cada una con su propio conjunto de archivos que representan la lógica y la interfaz gráfica.

### Archivo Principal:

- **Archivo**: main.dart

> Entrada principal de la aplicación donde se inicia la ejecución. Contiene la inicialización de la aplicación, la creación del widget principal, y la invocación de cualquier configuración inicial.


&copy; 2023 MotivationalApp
