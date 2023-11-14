// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../repositories/web_repository.dart';
import '../constant/custom_color.dart';

class CustomTextButton extends StatelessWidget {
  final String text_1;
  final String text_2;
  const CustomTextButton({
    Key? key,
    required this.text_1,
    required this.text_2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        showDialog(
            context: context,
            builder: (builder) {
              return AlertDialog(
                title: const Text("Alerta"),
                content: Text(
                  text_1,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      WebRepository().lounchURL();
                    },
                    child: const Text("Sim"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Não"),
                  ),
                ],
              );
            });
      },
      child: Text(
        text_2,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: CustomColor().getFillColor(),
        ),
      ),
    );
  }
}
