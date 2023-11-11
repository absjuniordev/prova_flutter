// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:target_sistemas/repositories/mock_auth_serivce.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

import '../../page/information_page.dart';

class CustomElevatedButtom extends StatefulWidget {
  final TextEditingController controllerUsuario;
  final TextEditingController controllerSenha;

  const CustomElevatedButtom({
    Key? key,
    required this.controllerUsuario,
    required this.controllerSenha,
  }) : super(key: key);

  @override
  _CustomElevatedButtomState createState() => _CustomElevatedButtomState();
}

class _CustomElevatedButtomState extends State<CustomElevatedButtom> {
  final MockAuthService mockAuthService = MockAuthService();
  late bool _loginInProgress;

  @override
  void initState() {
    super.initState();
    _loginInProgress = false;
  }

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
      onPressed: _loginInProgress ? null : () => _handleLogin(context),
      child: _loginInProgress
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(
              "Entrar",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: CustomColor().getFillColor(),
              ),
            ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      _loginInProgress = true;
    });

    final loginCorreto = await mockAuthService.login(
        widget.controllerUsuario.text, widget.controllerSenha.text);

    setState(() {
      _loginInProgress = false;
    });

    if (!isPasswordValid(widget.controllerSenha.text)) {
      showAlertDialog(
          context, "Atenção", "A senha não pode ter menos que dois caracteres");
    } else if (widget.controllerUsuario.text.contains(' ')) {
      showAlertDialog(
          context, "Atenção", "O nome de usuário não pode conter espaços");
    }

    if (loginCorreto) {
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 999),
          type: PageTransitionType.fade,
          child: const InformationPage(),
        ),
      );
    } else {
      showAlertDialog(context, "Atenção!", "Usuario não cadastrado");
    }
  }

  bool isPasswordValid(String password) {
    return password.length >= 2;
  }

  void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }
}
