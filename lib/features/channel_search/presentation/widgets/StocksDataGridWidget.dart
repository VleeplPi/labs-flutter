import 'package:flutter/widgets.dart';

import '../../domain/models/StocksDataSourceItem.dart';
import '../state_management/StocksDataGridState.dart';

class StocksDataGridWidget extends StatefulWidget {
  final StocksDataSourceItem stocksDataSourceItem;

  const StocksDataGridWidget(this.stocksDataSourceItem);

  @override
  State<StocksDataGridWidget> createState() => StocksDataGridState();
}