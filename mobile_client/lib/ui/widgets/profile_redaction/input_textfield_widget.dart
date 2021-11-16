import "package:flutter/material.dart";

class InputTextField extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final TextEditingController controller;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  const InputTextField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    required this.controller,
    this.maxLines,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 35,
        ),
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 9,
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 35,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(244, 244, 244, 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
    );
  }
}
