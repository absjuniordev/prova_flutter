import 'package:flutter/material.dart';
import 'package:target_sistemas/page/information_page.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

import '../shared/widgets/custom_textfield.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

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
                  icon: const Icon(Icons.person),
                  controller: controllerUsuario,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  inputSenha: true,
                  text: "Senha",
                  icon: const Icon(Icons.lock),
                  controller: controllerSenha,
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
                  onPressed: () {
                    final usuario = controllerUsuario.text;
                    final senha = controllerSenha.text;
                    if (senha.length < 2) {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return const AlertDialog(
                            title: Text("Atenção"),
                            content: Text(
                              "A senha não pode ter menos que dois caracteres",
                            ),
                          );
                        },
                      );
                    }
                    if (usuario.endsWith(' ') && senha.endsWith(' ')) {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return const AlertDialog(
                            title: Text("Atenção"),
                            content: Text(
                              "A senha não pode ter menos que dois caracteres",
                            ),
                          );
                        },
                      );
                    } else if (!usuario.endsWith(' ') && !senha.endsWith(' ')) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const InformationPage()));
                    }
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: CustomColor().getFillColor(),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                TextButton(
                  onPressed: () {},
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
