import 'package:flutter/material.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import 'package:target_sistemas/shared/widgets/custom_text_button.dart';
import '../shared/widgets/custom_elevated_button.dart';
import '../shared/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUsuario =
        TextEditingController(text: "abs.junnior");
    TextEditingController controllerSenha = TextEditingController(text: "1234");

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
                const Spacer(
                  flex: 5,
                ),
                CustomTextField(
                  text: "Usuário",
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  controller: controllerUsuario,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  inputSenha: true,
                  suffixIcon: true,
                  text: "Senha",
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  controller: controllerSenha,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtom(
                  controllerSenha: controllerSenha,
                  controllerUsuario: controllerUsuario,
                ),
                const Spacer(
                  flex: 3,
                ),
                const CustomTextButton(
                  text_1:
                      "Este link irá te direcionar para uma página externa, deseja continuar?",
                  text_2: "Politica de Privacidade",
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
