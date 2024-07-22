import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../domain/models/StocksDataSourceItem.dart';

final class DataGridService{


  Future<StocksDataSourceItem> createStocksDataSourceItem(List<List<dynamic>> csvData) async{
    List<GridColumn> columns = List<GridColumn>.generate(
        csvData[0].length, (cell) => GridColumn(
        columnName: '${csvData[0][cell]}',
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('${csvData[0][cell]}'),
        )
    )
    );

    List<DataGridRow> rows = List<DataGridRow>.generate(
        csvData.length-1,
            (row) => DataGridRow(
            cells: List<DataGridCell<dynamic>>.generate(
                csvData[row].length, (cell) => DataGridCell<String>(
                columnName: '${csvData[0][cell]}',
                value: '${csvData[row+1][cell]}'
            )
            )
        )
    );

    return StocksDataSourceItem(columns=columns,rows=rows);
  }
}