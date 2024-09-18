/**
 * Servicio para crear una base de datos estatica para manejar los gastos
 */


import '../models/expense_model.dart';

class ExpenseService {
  static final List<Expense> _expenses = [];

  static List<Expense> get expenses => List.unmodifiable(_expenses);

  static void addExpense(Expense expense) {
    _expenses.add(expense);
  }
}
