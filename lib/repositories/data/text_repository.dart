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
    //implementação em andamento
    listText.remove(i);
    setStringList(key, listText);
  }
}








// import 'package:shared_preferences/shared_preferences.dart';

// class TextReposytory {
//   static const _key = "txtList";

//   Future<void> addText(String text) async {
//     List<String> textList = await getTextList();
//     textList.add(text);
//     _saveText(textList);
//   }

//   Future<List<String>> getTextList() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_key) ?? [];
//   }

//   Future<void> removeText(String text) async {
//     List<String> textList = await getTextList();
//     textList.remove(text);
//     _saveText(textList);
//   }

//   void _saveText(List<String> textList) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setStringList(_key, textList);
//   }
// }
