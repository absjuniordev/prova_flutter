import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';

import 'package:target_sistemas/repositories/mock_auth_serivce.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

import '../../page/information_page.dart';
import '../../repositories/data/service/storage_service.dart';
import '../constant/alerts/custom_show_alert.dart';

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
  final mockAuthService = MockAuthService();
  var storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ElevatedButton(
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
        onPressed: storage.loginInProgress ? null : () => _handleLogin(context),
        child: storage.loginInProgress
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
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    storage.loginInProgress = true;

    final loginCorreto = await mockAuthService.login(
        widget.controllerUsuario.text, widget.controllerSenha.text);

    storage.loginInProgress = false;

    if (!isPasswordValid(widget.controllerSenha.text)) {
      // ignore: use_build_context_synchronously
      showAlertDialog(
          context, "Atenção", "A senha não pode ter menos que dois caracteres");
    } else if (widget.controllerUsuario.text.contains(' ')) {
      // ignore: use_build_context_synchronously
      showAlertDialog(
          context, "Atenção", "O nome de usuário não pode conter espaços");
    } else if (!loginCorreto &&
        widget.controllerUsuario.text.isNotEmpty &&
        widget.controllerSenha.text.isNotEmpty) {
      // ignore: use_build_context_synchronously
      showAlertDialog(context, "Atenção!", "Usuario não cadastrado");
    }

    if (loginCorreto) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 999),
          type: PageTransitionType.fade,
          child: const InformationPage(),
        ),
      );
    }
  }

  bool isPasswordValid(String password) {
    return password.length >= 2;
  }
}
