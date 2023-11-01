import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFelid extends StatelessWidget {
  const TextFelid({super.key, this.onSubmitted,this.controller});
  final void Function(String)? onSubmitted;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      autofocus: true,
      decoration:const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style:const TextStyle(color: Colors.white),
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
    );
  }
}
