import 'package:flutter/material.dart';

import '../const/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool expands;

  const MyTextField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.maxLength,
    this.expands = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary), // กำหนดสีเมื่อรับ focus
        ),
        counterText: '',
      ),
      autofocus: true,
      validator: validator,
      textAlignVertical: TextAlignVertical.top,
      // keyboardType: TextInputType.multiline,
      maxLength: maxLength,
      expands: expands,
      maxLines: expands ? null : 1,
    );
  }
}
// textAlignVertical:
//                                             TextAlignVertical.top,
//                                         maxLength:
//                                             500, // กำหนดความยาวสูงสุดที่สามารถพิมพ์ได้
//                                         maxLines:
//                                             null, // กำหนดให้สามารถพิมพ์หลายบรรทัดได้
//                                         keyboardType: TextInputType.multiline,