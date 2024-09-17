import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../services/expense_service.dart';

class HistoryExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = ExpenseService.expenses;

    // Preparar los datos para el gráfico
    List<_ChartData> chartData = expenses.map((expense) {
      return _ChartData(expense.category, expense.amount);
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
          // Gráfico de barras
          Expanded(
            flex: 2,
            child: SfCartesianChart(
              title: ChartTitle(text: 'Gastos por Categoría'),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<_ChartData, String>>[
                BarSeries<_ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.category,
                  yValueMapper: (_ChartData data, _) => data.amount,
                  color: Color.fromARGB(255, 105, 48, 204),
                  name: 'Gastos',
                )
              ],
            ),
          ),
          // Lista de gastos
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  title: Text(expense.category, style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    'Monto: ${expense.amount}\nFecha: ${expense.date.toLocal().toShortDateString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Colors.grey[800],
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

// Clase para manejar los datos del gráfico
class _ChartData {
  _ChartData(this.category, this.amount);
  final String category;
  final double amount;
}
