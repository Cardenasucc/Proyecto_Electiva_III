/**
 * Widget para manejar el diseño del boton de monto
 */

import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final double? width;

  const AmountInput({
    required this.onChanged,
    required this.validator,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 250.0,
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Monto',
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
