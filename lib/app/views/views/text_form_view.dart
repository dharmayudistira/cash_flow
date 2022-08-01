import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class TextFormView extends GetView {
  final TextEditingController editingController;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final String label;
  final Function()? onTap;
  final Function()? onSuffixTap;
  final bool? isReadOnly;
  final bool? isObscured;
  final bool? obscureState;

  const TextFormView({
    Key? key,
    required this.editingController,
    this.inputFormatter,
    this.inputType,
    required this.label,
    this.onTap,
    this.onSuffixTap,
    this.isReadOnly,
    this.isObscured,
    this.obscureState,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      inputFormatters: inputFormatter,
      keyboardType: inputType,
      onTap: onTap,
      obscureText: obscureState ?? false,
      obscuringCharacter: "*",
      readOnly: isReadOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: (isObscured ?? false) ? getSuffixIcon() : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        labelText: label,
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: 'Decker',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget? getSuffixIcon() => IconButton(
        onPressed: onSuffixTap,
        icon: (obscureState ?? false)
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      );
}
