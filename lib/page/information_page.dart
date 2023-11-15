import 'package:flutter/material.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import '../shared/widgets/custom_text_button.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

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
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
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
                  itemCount: 10,
                  itemBuilder: (itemBuilder, i) {
                    return Card(
                      color: CustomColor().getFillColor(),
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Spacer(flex: 1),
                            const Text(
                              "Texto Digitado 1",
                              style: TextStyle(fontSize: 20),
                            ),
                            const Spacer(flex: 3),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.border_color,
                                size: 38,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
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
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: CustomColor().getFillColor(),
                  ),
                ),
              ),
              const SizedBox(height: 110),
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
