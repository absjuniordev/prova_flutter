// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StorageService on _StorageService, Store {
  late final _$textListAtom =
      Atom(name: '_StorageService.textList', context: context);

  @override
  List<String> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(List<String> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$isEditingAtom =
      Atom(name: '_StorageService.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$loginInProgressAtom =
      Atom(name: '_StorageService.loginInProgress', context: context);

  @override
  bool get loginInProgress {
    _$loginInProgressAtom.reportRead();
    return super.loginInProgress;
  }

  @override
  set loginInProgress(bool value) {
    _$loginInProgressAtom.reportWrite(value, super.loginInProgress, () {
      super.loginInProgress = value;
    });
  }

  late final _$showPassWordAtom =
      Atom(name: '_StorageService.showPassWord', context: context);

  @override
  bool get showPassWord {
    _$showPassWordAtom.reportRead();
    return super.showPassWord;
  }

  @override
  set showPassWord(bool value) {
    _$showPassWordAtom.reportWrite(value, super.showPassWord, () {
      super.showPassWord = value;
    });
  }

  late final _$editingIndexAtom =
      Atom(name: '_StorageService.editingIndex', context: context);

  @override
  int get editingIndex {
    _$editingIndexAtom.reportRead();
    return super.editingIndex;
  }

  @override
  set editingIndex(int value) {
    _$editingIndexAtom.reportWrite(value, super.editingIndex, () {
      super.editingIndex = value;
    });
  }

  late final _$setTextAsyncAction =
      AsyncAction('_StorageService.setText', context: context);

  @override
  Future<void> setText(String text) {
    return _$setTextAsyncAction.run(() => super.setText(text));
  }

  late final _$_setTextLisAsyncAction =
      AsyncAction('_StorageService._setTextLis', context: context);

  @override
  Future<void> _setTextLis(List<String> texts) {
    return _$_setTextLisAsyncAction.run(() => super._setTextLis(texts));
  }

  late final _$getTextListAsyncAction =
      AsyncAction('_StorageService.getTextList', context: context);

  @override
  Future<List<String>> getTextList() {
    return _$getTextListAsyncAction.run(() => super.getTextList());
  }

  late final _$deleteTextAsyncAction =
      AsyncAction('_StorageService.deleteText', context: context);

  @override
  Future<void> deleteText(int i) {
    return _$deleteTextAsyncAction.run(() => super.deleteText(i));
  }

  late final _$editiTextAsyncAction =
      AsyncAction('_StorageService.editiText', context: context);

  @override
  Future<void> editiText(int i, String text) {
    return _$editiTextAsyncAction.run(() => super.editiText(i, text));
  }

  late final _$_StorageServiceActionController =
      ActionController(name: '_StorageService', context: context);

  @override
  dynamic enableShowPassWord() {
    final _$actionInfo = _$_StorageServiceActionController.startAction(
        name: '_StorageService.enableShowPassWord');
    try {
      return super.enableShowPassWord();
    } finally {
      _$_StorageServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic desableShowPassWord() {
    final _$actionInfo = _$_StorageServiceActionController.startAction(
        name: '_StorageService.desableShowPassWord');
    try {
      return super.desableShowPassWord();
    } finally {
      _$_StorageServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startEditing() {
    final _$actionInfo = _$_StorageServiceActionController.startAction(
        name: '_StorageService.startEditing');
    try {
      return super.startEditing();
    } finally {
      _$_StorageServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic endEditing() {
    final _$actionInfo = _$_StorageServiceActionController.startAction(
        name: '_StorageService.endEditing');
    try {
      return super.endEditing();
    } finally {
      _$_StorageServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startEditingItem(int index) {
    final _$actionInfo = _$_StorageServiceActionController.startAction(
        name: '_StorageService.startEditingItem');
    try {
      return super.startEditingItem(index);
    } finally {
      _$_StorageServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textList: ${textList},
isEditing: ${isEditing},
loginInProgress: ${loginInProgress},
showPassWord: ${showPassWord},
editingIndex: ${editingIndex}
    ''';
  }
}
