/**
 * Widget para manejar el diseño de categorias 
 */

import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  final String? selectedCategory;
  final List<String> categories;
  final Function(String?) onChanged;
  final double? dropdownWidth;
  final double? fontSize;

  const CategoryDropdown({
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
    this.dropdownWidth,
    this.fontSize = 16.0,
  });

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.dropdownWidth ?? 250.0,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Categoría',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          filled: true,
          fillColor: Colors.black,
        ),
        value: widget.selectedCategory,
        items: widget.categories.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(
              category,
              style: TextStyle(color: Colors.white, fontSize: widget.fontSize), 
            ),
          );
        }).toList(),
        onChanged: widget.onChanged,
        dropdownColor: Colors.black, 
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w500,
        ),
        icon: Icon(Icons.arrow_downward, color: Colors.deepPurple),
      ),
    );
  }
}
