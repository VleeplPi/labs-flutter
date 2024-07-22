import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StocksDataSourceItem{

  final List<GridColumn> columns;
  final List<DataGridRow> rows;

  StocksDataSourceItem(this.columns, this.rows);
}