import '../text_repository.dart';
import 'package:mobx/mobx.dart';
part 'storage_service.g.dart';

class StorageService = _StorageService with _$StorageService;

abstract class _StorageService with Store {
  static const key = "text_key";

  @observable
  List<String> textList = [];

  @observable
  bool isEditing = false;

  @observable
  bool showPassWord = true;

  @observable
  int editingIndex = -1;

  @action
  enableShowPassWord() {
    showPassWord = true;
  }

  @action
  desableShowPassWord() {
    showPassWord = false;
  }

  @action
  startEditing() {
    isEditing = true;
  }

  @action
  endEditing() {
    isEditing = false;
    editingIndex = -1;
  }

  @action
  void startEditingItem(int index) {
    endEditing();
    editingIndex = index;
    startEditing();
  }

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
