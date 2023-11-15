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
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 35),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: CustomColor().getFillColor(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(10, 120),
                    topRight: Radius.elliptical(10, 120),
                    bottomLeft: Radius.elliptical(10, 120),
                    bottomRight: Radius.elliptical(10, 120),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (itemBuilder, i) {
                    return const Card(
                      margin: EdgeInsets.all(8),
                      child: Text("44"),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
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
