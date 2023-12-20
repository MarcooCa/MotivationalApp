


class MotivationalQuote {
  String quote;
  String author;

  MotivationalQuote({required this.quote, required this.author});

  factory MotivationalQuote.fromJson(Map<String, dynamic> json) {
    return MotivationalQuote(
      quote: json['content'] ?? '', // Asegúrate de reemplazar 'content' con el nombre correcto del campo de la cita en la respuesta JSON
      author: json['author'] ?? '', // Asegúrate de reemplazar 'author' con el nombre correcto del campo del autor en la respuesta JSON
    );
  }
}