import 'package:mongo_dart/mongo_dart.dart';

class MongoDbProvider {
  static Db? _db;

  static Future<void> initDb() async {
    _db = await Db.create('mongodb+srv://marco:admin123@micluster.oyjdfkx.mongodb.net/apiconfig');
    await _db!.open();
  }

  static Future<String> obtenerAPIKey() async {
    if (_db == null) {
      await initDb();
    }

    final collection = _db!.collection('coleccion-apikey');
    final query = where.eq('nombre', 'clave_api_deepl');
    final result = await collection.findOne(query);

    if (result != null) {
      return result['valor'] as String;
    } else {
      throw Exception('Clave de API no encontrada');
    }
  }
}
