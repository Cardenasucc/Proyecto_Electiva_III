import '../models/income_model.dart';

class IncomeService {
  // Lista estática privada para almacenar ingresos
  static final List<Income> _incomes = [];

  // Método para obtener la lista de ingresos
  static List<Income> get incomes => List.unmodifiable(_incomes);

  // Método para agregar un nuevo ingreso
  static void addIncome(Income income) {
    _incomes.add(income);
  }
}
