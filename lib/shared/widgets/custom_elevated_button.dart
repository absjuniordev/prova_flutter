import 'package:flutter/material.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';
import '../../page/information_page.dart';

class CustomElevatedButtom extends StatelessWidget {
  final TextEditingController controllerUsuario;
  final TextEditingController controllerSenha;

  const CustomElevatedButtom({
    Key? key,
    required this.controllerUsuario,
    required this.controllerSenha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
                  "A Senha não pode ter menos que dois caracteres",
                ),
              );
            },
          );
        } else if (usuario.endsWith(' ')) {
          showDialog(
            context: context,
            builder: (builder) {
              return const AlertDialog(
                title: Text("Atenção"),
                content: Text(
                  "O nome de Usuario não pode conter espaços",
                ),
              );
            },
          );
        } else if (!usuario.endsWith(' ') && !senha.endsWith(' ')) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => const InformationPage(),
              ));
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
    );
  }
}