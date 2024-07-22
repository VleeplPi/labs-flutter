import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StocksDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];
  int _currentMaxValue = 30;

  StocksDataSource(this._dataGridRows) {
    print('ROWS: ${_dataGridRows.length}');

    // _dataGridRows = List<DataGridRow>.generate(
    //     30,
    //         (index) => DataGridRow(cells: [
    //       DataGridCell<int>(columnName: 'id', value: index),
    //       DataGridCell<String>(columnName: 'name', value: 'Name $index'),
    //     ]));
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding:  const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }

  @override
  Future<bool> handleLoadMoreRows() async {
    await Future.delayed(const Duration(seconds: 2));

    int oldRowsLength = _dataGridRows.length;
    int newRowLen = oldRowsLength + 30;

    // List<DataGridRow> newRows = List<DataGridRow>.generate(
    //   30,
    //       (index) => DataGridRow(cells: [
    //     DataGridCell<String>(columnName: 'id', value: _currentMaxValue + index),
    //     DataGridCell<String>(
    //         columnName: 'name', value: 'Name ${_currentMaxValue + index}'),
    //   ]),
    // );
    //
    // _dataGridRows.addAll(newRows);
    // _currentMaxValue = newRowLen;
    notifyListeners();

    return true;
  }

  @override
  bool get hasMoreRows => true;
}