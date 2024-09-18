/**
 * Pantalla para manejar las peticiones de los costos
 */

import 'package:flutter/material.dart';
import '../widgets/category_dropdown.dart';
import '../widgets/amount_input.dart';
import '../widgets/date_selector.dart';
import '../models/income_model.dart';
import '../services/income_service.dart';

class AddIncomeScreen extends StatefulWidget {
  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  double? _amount;
  DateTime _selectedDate = DateTime.now();

  final List<String> _categories = [
    'Salario',
    'Bonificaciones',
    'Inversiones',
    'Otros'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Agregar Ingreso',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryDropdown(
                selectedCategory: _selectedCategory,
                categories: _categories,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              AmountInput(
                onChanged: (value) {
                  _amount = double.tryParse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un monto';
                  }
                  _amount = double.tryParse(value);
                  if (_amount == null || _amount! <= 0) {
                    return 'Ingrese un monto válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DateSelector(
                initialDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newIncome = Income(
                        category: _selectedCategory!,
                        amount: _amount!,
                        date: _selectedDate,
                      );
                      IncomeService.addIncome(newIncome);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Agregar Ingreso'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
