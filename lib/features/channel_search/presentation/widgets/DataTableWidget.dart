import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<List<dynamic>> data;

  DataTableWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: data[0].map((header) => DataColumn(label: Text(header.toString()))).toList(),
        rows: data.sublist(1).map((row) {
          return DataRow(
            cells: row.map((cell) => DataCell(Text(cell.toString()))).toList(),
          );
        }).toList(),
      ),
    );
  }
}