import 'package:flutter/material.dart';
import '../widgets/data_chart.dart'; // Asegúrate de que la ruta sea correcta
import '../services/expense_service.dart';

class HistoryExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = ExpenseService.expenses;

    // Preparar los datos para el gráfico
    List<ChartData> chartData = expenses.map((expense) {
      return ChartData(expense.category, expense.amount);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 48, 204),
        title: Text(
          'Historial de Gastos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Gráfico de barras utilizando el widget personalizado
          Expanded(
            flex: 2,
            child: DataChart(
              chartData: chartData,
              title: 'Gastos por Categoría',
              barColor: Color.fromARGB(255, 105, 48, 204),
            ),
          ),
          // Lista de gastos con tarjetas mejoradas
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Monto: \$${expense.amount}',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                expense.date.toLocal().toShortDateString(),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

extension DateFormatting on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
