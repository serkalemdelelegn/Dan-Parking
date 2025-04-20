import 'package:flutter/material.dart';

// ignore: camel_case_types
class myTextField extends StatelessWidget {
  final String title;
  final TextEditingController _controller;

  const myTextField(this.title, this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (value) {
        if (value!.isEmpty) {
          return title;
        }
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffD9D9D9).withOpacity(0.5),
          border: InputBorder.none,
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
          )),
    );
  }
}
