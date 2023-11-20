import '../text_repository.dart';
import 'package:mobx/mobx.dart';
part 'storage_service.g.dart';

class StorageService = _StorageService with _$StorageService;

abstract class _StorageService with Store {
  static const key = "text_key";

  @observable
  List<String> textList = [];

  @action
  Future<void> setText(String text) async {
    textList = await getTextList();

    textList.insert(0, text);

    await Future.microtask(() => _setTextLis(textList));
  }

  @action
  Future<void> _setTextLis(List<String> texts) async =>
      await TextRepository().setStringList(key, texts);

  @action
  Future<List<String>> getTextList() async =>
      await TextRepository().getStringList(key);

  @action
  Future<void> deleteText(int i) async {
    await Future.microtask(() => TextRepository().deleteText(key, i));
  }

  @action
  Future<void> editiText(int i, String text) async {
    await Future.microtask(() => TextRepository().editiText(key, i, text));
  }
}
