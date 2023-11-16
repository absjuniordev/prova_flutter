import '../text_repository.dart';

class StorageService {
  static const key = "text_key";

  Future<void> setText(String text) async {
    List<String> textList = await getTextList();
    textList.add(text);
    _setTextLis(textList);
  }

  Future<void> _setTextLis(List<String> texts) async =>
      await TextRepository().setStringList(key, texts);

  Future<List<String>> getTextList() async =>
      await TextRepository().getStringList(key);

  Future<void> deleteText(int i) async =>
      await TextRepository().deleteText(key, i);
}
