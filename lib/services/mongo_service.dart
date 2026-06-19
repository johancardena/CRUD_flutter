import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static Db? db;
  static DbCollection? productos;

  static Future<void> connect() async {
    try{
      db = await Db.create(
        "mongodb+srv://mateo0:Mateo12345@cluster0.i6plprb.mongodb.net/media_explorer"
      );

      await db!.open();
      productos = db!.collection('productos');
    }catch (e) {
      print("MONGODB CONECTADO");
      print(e);
      rethrow;
    }
  }
}