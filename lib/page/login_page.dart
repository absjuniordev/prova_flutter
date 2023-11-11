import 'package:flutter/material.dart';
import 'package:target_sistemas/repositories/web_repository.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import '../shared/widgets/custom_elevated_button.dart';
import '../shared/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUsuario = TextEditingController(text: "");
    TextEditingController controllerSenha = TextEditingController(text: "");

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
                  flex: 2,
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
                  obscureText: true,
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
                  flex: 2,
                ),
                TextButton(
                  onPressed: () async {
                    WebRepository().lounchURL();
                  },
                  child: Text(
                    "Politica de Privacidade",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: CustomColor().getFillColor(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
