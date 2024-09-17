import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../services/income_service.dart';

class HistoryIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incomes = IncomeService.incomes;

    // Preparar los datos para el gráfico
    List<_ChartData> chartData = incomes.map((income) {
      return _ChartData(income.category, income.amount);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 48, 204),
        title: Text(
          'Historial de Ingresos',
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
              title: ChartTitle(text: 'Ingresos por Categoría'),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<_ChartData, String>>[
                BarSeries<_ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.category,
                  yValueMapper: (_ChartData data, _) => data.amount,
                  color: Color.fromARGB(255, 105, 48, 204),
                  name: 'Ingresos',
                )
              ],
            ),
          ),
          // Lista de ingresos
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: incomes.length,
              itemBuilder: (context, index) {
                final income = incomes[index];
                return ListTile(
                  title: Text(income.category, style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    'Monto: ${income.amount}\nFecha: ${income.date.toLocal().toShortDateString()}',
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
