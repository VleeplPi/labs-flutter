import 'package:lab10/features/channel_search/domain/models/ChartDataResult.dart';

import '../../domain/models/ChartData.dart';

final class ChartService{

  Future<List<ChartData>> filterChartDataByYear(List<ChartData> chartData, int selectedYear) async{
    print("chart data before select: ${chartData.length}");
    List<ChartData> filteredChartData = chartData.where((ChartData itemData) => itemData.date.year == selectedYear).toList();
    print("chart data after select: ${chartData.length}");
    return filteredChartData;

  }
}