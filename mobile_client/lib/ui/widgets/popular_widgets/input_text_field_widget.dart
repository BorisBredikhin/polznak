import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

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
    this.textStyle = TextStyles.blackSize10Weight400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      style: textStyle,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        contentPadding:
            contentPadding ?? const EdgeInsets.all(6),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        hintText: hintText,
        hintStyle: TextStyles.textFieldHintStyle,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isObscured ?? false,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
    );
  }
}
