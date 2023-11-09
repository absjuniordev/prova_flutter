// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:target_sistemas/shared/constant/custom_color.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Icon icon;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.icon,
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
              color: CustomColor().getFillColor(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            decoration: InputDecoration(
              label: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: CustomColor().getFillColor(),
            ),
          ),
        ),
      ],
    );
  }
}
