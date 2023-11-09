import 'package:flutter/material.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

import '../shared/widgets/custom_textfield.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextField(
                  text: "Usuário",
                  icon: Icon(Icons.person),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  text: "Senha",
                  icon: Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColor().getButtomColor(),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(200, 48),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Entrar"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Politica de Privacidade"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
