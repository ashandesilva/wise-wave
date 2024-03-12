import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffffffff)),
          ),
          filled: true,
          fillColor: const Color(0xffffffff),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 0.5,
            color: Color(0xffbababa),
          ),
        ),
      ),
    );
  }
}
