import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:target_sistemas/shared/constant/alerts/custom_show_alert_confrimacao.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import '../repositories/data/service/storage_service.dart';
import '../shared/constant/alerts/custom_show_alert.dart';
import '../shared/widgets/custom_text_button.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final storage = StorageService();
  final _controllerText = TextEditingController(text: "");
  final _inLineController = TextEditingController(text: "");
  final _listText = ObservableList<String>();

  @override
  void initState() {
    super.initState();
    obter();
  }

  obter() async {
    _listText.clear();
    var textList = await storage.getTextList();
    if (textList.isNotEmpty) {
      _listText.addAll(textList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                CustomColor().getGradientSecColor(),
                CustomColor().getGradientMainColor(),
              ],
            ),
          ),
          child: Observer(
            builder: (_) => ListView(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: CustomColor().getFillColor(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(5, 130),
                      topRight: Radius.elliptical(5, 130),
                      bottomRight: Radius.elliptical(5, 130),
                      bottomLeft: Radius.elliptical(5, 130),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: _listText.length,
                    itemBuilder: (itemBuilder, i) {
                      var list = _listText[i];

                      return Card(
                        color: CustomColor().getFillColor(),
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: storage.isEditing && storage.editingIndex == i
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _inLineController,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await storage.editiText(
                                          i,
                                          _inLineController.text,
                                        );
                                        await obter();
                                        await storage.endEditing();
                                      },
                                      child: const Icon(
                                        Icons.check_box,
                                        size: 38,
                                        color: Colors.green,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await storage.endEditing();
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Color.fromARGB(255, 228, 20, 5),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    const Spacer(flex: 1),
                                    Text(
                                      list,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(flex: 3),
                                    InkWell(
                                      onTap: () async {
                                        storage.startEditingItem(i);
                                        _inLineController.text = list[i];
                                      },
                                      child: const Icon(
                                        Icons.border_color,
                                        size: 38,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await showDeleteConfirmationDialog(
                                            context, i);
                                        await obter();
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Color.fromARGB(255, 228, 20, 5),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: storage.isEditing == false
                      ? TextField(
                          autofocus: true,
                          onSubmitted: (value) async {
                            if (value.isEmpty) {
                              showAlertDialog(
                                  context, "Atenção", "Preencha campo");
                            } else {
                              await storage.setText(_controllerText.text);
                              _controllerText.text = "";
                              await obter();
                            }
                          },
                          controller: _controllerText,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                            hintText: "Digite seu texto",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: CustomColor().getFillColor(),
                          ),
                        )
                      : null,
                ),
                const SizedBox(height: 85),
                const CustomTextButton(
                  text_1:
                      "Este link irá te direcionar para uma página externa, deseja continuar?",
                  text_2: "Politica de Privacidade",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
