# MotivationalApp

_Motivación en frases cortas para inspirar tu día._

## Equipo

- Marco Cancino -  Desarrollador Principal 
- Benjamin Bustamante - Arquitecto De Software
- Sergio Retamal - Encargado De Diseño

## Caso de uso

A diario las personas buscan algún tipo de motivación que les permita empezar su día de mejor manera, MotivationalApp nace para impulsar un comienzo positivo del día con un mensaje para elevar el ánimo y comenzar mejor la jornada. Con el surgimiento de las nuevas tecnologías muchas personas comparten inspiración a través de sus redes sociales se ha vuelto clave para la salud mental y para simplificar esta tarea la aplicación permite que se descargue la imágen al dispositivo con el mensaje, el autor y un fondo vibrante. _¡Motiva y comparte para inspirar a muchos más!"_

## Tecnologías utilizadas

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Screenshot](https://img.shields.io/badge/Screenshot-2.1.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![ImageGallerySave](https://img.shields.io/badge/Image_Gallery_Save-2.0.3-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![GoogleFonts](https://img.shields.io/badge/Google_Fonts-6.1.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)

### Características a implementar
Con el fin de explicar el funcionamiento de la aplicación se describe el uso de los Widgets seleccionados a continuación:

- El uso del Widget [Screenshot](https://pub.dev/packages/screenshot) nos permitirá capturar el mensaje y fondo a través de una imagen.
- El uso del Widget [ImageGallerySave](https://pub.dev/packages/image_gallery_saver) nos permitirá guardar en la galería de nuestro dispositivo la imagen capturada anteriormente.
- El uso del Widget [GoogleFonts](https://pub.dev/packages/google_fonts) nos permitirá el uso de diversas fuentes, con el fin de hacer la aplicación más amigable a la vista. 

## Diseño

## Implementación

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
