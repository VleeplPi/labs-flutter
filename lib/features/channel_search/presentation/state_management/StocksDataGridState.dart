import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab10/features/channel_search/domain/models/StocksDataSourceItem.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../application/services/DataGridService.dart';
import '../../application/services/FileService.dart';
import '../../domain/models/StocksDataSource.dart';
import '../widgets/StocksDataGridWidget.dart';

class StocksDataGridState extends State<StocksDataGridWidget> {

  // // StocksDataSource _dataSource;
  // StocksDataSourceItem _stocksDataSourceItem;
  //
  // StocksDataGridState( this._stocksDataSourceItem){
  //   // _dataSource = StocksDataSource(_stocksDataSourceItem.rows);
  // }

  // <GridColumn>[
  // GridColumn(
  // columnName: 'id',
  // label: Container(
  // padding: EdgeInsets.all(8.0),
  // alignment: Alignment.center,
  // child: Text('ID'),
  // ),
  // ),
  // GridColumn(
  // columnName: 'name',
  // label: Container(
  // padding: EdgeInsets.all(8.0),
  // alignment: Alignment.center,
  // child: Text('Name'),
  // ),
  // ),
  // ],

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        columnWidthMode: ColumnWidthMode.auto,
        source: StocksDataSource(widget.stocksDataSourceItem.rows),
        columns: widget.stocksDataSourceItem.columns
    );
  }
}
