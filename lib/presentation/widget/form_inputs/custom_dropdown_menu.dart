import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final String? hintText;

  CustomDropdownMenu({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    required this.getLabel,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items:
          items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(getLabel(item)),
            );
          }).toList(),
      validator:
          validator ??
          validator ??
          (value) {
            if (value == null) {
              return "Please Select Value";
            }
            return null;
          },
      onChanged: onChanged,
    );
  }
}
