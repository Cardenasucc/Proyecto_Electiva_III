/**
 * Servicio para crear una base de datos estatica para manejar los costos
 */

import '../models/income_model.dart';

class IncomeService {
  static final List<Income> _incomes = [];

  static List<Income> get incomes => List.unmodifiable(_incomes);

  static void addIncome(Income income) {
    _incomes.add(income);
  }
}
