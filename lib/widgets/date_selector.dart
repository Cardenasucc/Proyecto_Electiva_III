import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  DateSelector({
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        width: 250.0,
        height: 50,
        padding: EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedDate == DateTime(2000, 1, 1) ? 'Fecha' : 'Fecha: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                style: TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 11.0),
              child: Icon(Icons.calendar_today, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
