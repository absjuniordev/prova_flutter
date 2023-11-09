import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  final bool? inputSenha;

  const CustomTextField({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
    this.inputSenha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60, bottom: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: CustomColor().getFillColor(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
              inputSenha == true
                  ? FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                  : FilteringTextInputFormatter.singleLineFormatter
            ],
            decoration: InputDecoration(
              label: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: CustomColor().getFillColor(),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
