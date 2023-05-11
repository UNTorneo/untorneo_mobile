import 'package:flutter/material.dart';

class CustomDropdownField<E> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.value,
    required this.itemAsString,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  final List<E> items;
  final E? value;
  final String Function(E) itemAsString;
  final void Function(E?) onChanged;
  final String? Function(E?)? validator;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<E>(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          labelText: labelText,
          hintText: hintText,
        ),
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(itemAsString(item)),
              ),
            )
            .toList(),
        onChanged: (e) {
          onChanged(e);
          FocusScope.of(context).requestFocus(FocusNode());
        },
        value: value,
        validator: validator,
      ),
    );
  }
}
