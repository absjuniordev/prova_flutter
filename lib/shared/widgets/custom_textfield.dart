// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:target_sistemas/repositories/data/service/storage_service.dart';
import 'package:target_sistemas/shared/constant/custom_color.dart';

class CustomTextField extends StatefulWidget {
  final String? text;
  final Icon? icon;
  final bool? suffixIcon;
  final TextEditingController controller;
  final bool? inputSenha;
  final bool? obscureText;

  const CustomTextField({
    Key? key,
    this.text = "",
    this.icon,
    this.suffixIcon,
    required this.controller,
    this.inputSenha,
    this.obscureText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60, bottom: 10),
            child: Text(
              widget.text!,
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
                widget.inputSenha == true
                    ? FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                    : FilteringTextInputFormatter.singleLineFormatter
              ],
              decoration: InputDecoration(
                prefixIcon: widget.icon,
                suffixIcon: widget.suffixIcon == true
                    ? InkWell(
                        child: storage.showPassWord == false
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ),
                        onTap: () async {
                          if (storage.showPassWord) {
                            await storage.desableShowPassWord();
                          } else {
                            await storage.enableShowPassWord();
                          }
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: CustomColor().getFillColor(),
              ),
              controller: widget.controller,
              obscureText:
                  widget.obscureText == true && storage.showPassWord == true
                      ? true
                      : false,
            ),
          ),
        ],
      ),
    );
  }
}
