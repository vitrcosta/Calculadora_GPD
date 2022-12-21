import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'field_validate.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hint;
  final int validate;
  final int length;
  const InputField(
      {super.key,
      required this.onChanged,
      required this.hint,
      required this.controller,
      required this.validate,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Stack(
        children: [
          TextField(
            maxLength: length,
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              counterText: "",
              filled: true,
              hintText: hint,
              fillColor: const Color.fromRGBO(17, 90, 71, 1),
              hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(55, 124, 97, 1),
              ),
            ),
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          FieldValidate(
            validate: validate,
          ),
        ],
      ),
    );
  }
}
