import '../models/expense_model.dart';

class ExpenseService {
  // Lista estática privada para almacenar gastos
  static final List<Expense> _expenses = [];

  // Método para obtener la lista de gastos
  static List<Expense> get expenses => List.unmodifiable(_expenses);

  // Método para agregar un nuevo gasto
  static void addExpense(Expense expense) {
    _expenses.add(expense);
  }
}
