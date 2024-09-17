import 'package:flutter/material.dart';
import '../widgets/category_dropdown.dart';
import '../widgets/amount_input.dart';
import '../widgets/date_selector.dart';
import '../models/expense_model.dart';
import '../services/expense_service.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  double? _amount;
  DateTime _selectedDate = DateTime.now();

  final List<String> _categories = [
    'Comida',
    'Transporte',
    'Vivienda',
    'Otros'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Agregar Gasto',
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
                  setState(() {
                    _amount = double.tryParse(value);
                  });
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
                      final newExpense = Expense(
                        category: _selectedCategory!,
                        amount: _amount!,
                        date: _selectedDate,
                      );
                      ExpenseService.addExpense(newExpense);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Agregar Gasto'),
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
