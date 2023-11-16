import 'package:flutter/material.dart';
import 'package:target_sistemas/model/text_model.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import '../repositories/data/service/storage_service.dart';
import '../shared/custom_show_alert.dart';
import '../shared/widgets/custom_text_button.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final ScrollController _scrollController = ScrollController();
  StorageService storage = StorageService();
  var controllerText = TextEditingController(text: "");
  var _listText = [];

  @override
  void initState() {
    super.initState();
    obter();
  }

  obter() async {
    _listText = await storage.getTextList();

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    setState(() {});
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
          child: ListView(
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
                  controller: _scrollController,
                  reverse: true,
                  itemCount: _listText.length,
                  itemBuilder: (itemBuilder, i) {
                    var list = _listText[i];
                    obter();
                    return Card(
                      color: CustomColor().getFillColor(),
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Spacer(flex: 1),
                            Text(
                              list,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Spacer(flex: 3),
                            InkWell(
                              onTap: () async {},
                              child: const Icon(
                                Icons.border_color,
                                size: 38,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      title: const Text("Alerta"),
                                      content: const Text(
                                          "Esta ação ira excluir o texto, deseja continuar?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Não"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await storage.deleteText(i);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Sim"),
                                        ),
                                      ],
                                    );
                                  },
                                );
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
                child: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    if (value.isEmpty) {
                      showAlertDialog(context, "Atenção", "Preencha campo");
                    } else {
                      storage.setText(controllerText.text);
                      controllerText.text = "";
                    }
                  },
                  controller: controllerText,
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
                ),
              ),
              const SizedBox(height: 100),
              const CustomTextButton(
                text_1:
                    "Este link irá te direcionar para uma página externa, deseja continuar?",
                text_2: "Politica de Privacidade",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
