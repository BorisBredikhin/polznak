import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final bool? isObscured;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  const InputTextField({
    Key? key,
    this.contentPadding,
    required this.controller,
    this.isObscured,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.onTap,
    this.textStyle = const TextStyle(fontSize: 10, color: Colors.black),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      // style: const TextStyle(
      //   fontSize: 10,
      //   color: Colors.black,
      // ),
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        contentPadding:
            contentPadding == null ? const EdgeInsets.all(6) : contentPadding!,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
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
          minHeight: 0,
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
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isObscured == null ? false : isObscured!,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
    );
  }
}
