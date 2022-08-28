import 'package:flutter/material.dart';

class CustomTextFieldType2 extends StatelessWidget {
  CustomTextFieldType2({
    Key? key,
    required this.editingController,
    required this.fieldTitle,
    required this.maxLines,
    this.validator
  }) : super(key: key);
  final String fieldTitle;
  final TextEditingController editingController;
  final int maxLines;
  var validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      minLines: 1,
      maxLines: maxLines,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        labelText: fieldTitle,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}
