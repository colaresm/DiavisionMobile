import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({required this.dateController,super.key});
  final TextEditingController dateController;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        labelText: 'Data de Nascimento',
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }
    Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}
