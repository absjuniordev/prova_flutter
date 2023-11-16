class TextModel {
  int _id = 0;
  String _text = "";

  TextModel(this._text, this._id);

  set id(int id) => this._id = id;
  set text(String text) => this._text = text;

  int get id => this._id;
  String get text => this._text;
}
