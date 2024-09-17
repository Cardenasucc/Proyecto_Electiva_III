import 'package:flutter/material.dart';
import '../widgets/animated_button.dart';
import 'add_income_screen.dart';
import 'add_expense_screen.dart'; 
import 'history_expense_screen.dart'; 
import 'history_income_screen.dart'; 

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 48, 204),
        title: Text(
          'Gestión Financiera',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              title: 'Agregar Gasto',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpenseScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedButton(
              title: 'Agregar Ingreso', 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddIncomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedButton(
              title: 'Historial de Gastos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryExpenseScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedButton(
              title: 'Historial de Ingresos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryIncomeScreen(), 
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
