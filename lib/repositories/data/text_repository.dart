import 'package:shared_preferences/shared_preferences.dart';

class TextRepository {
  setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, values);
  }

  Future<List<String>> getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  Future<void> deleteText(String key, int i) async {
    List<String> listText = await getStringList(key);
    if (i >= 0 && i < listText.length) {
      listText.removeAt(i);
      setStringList(key, listText);
    } else {
      throw Exception("Índice inválido para remoção");
    }
  }
}
