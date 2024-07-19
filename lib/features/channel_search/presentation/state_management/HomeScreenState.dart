import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab10/features/channel_search/application/services/ChartService.dart';
import 'package:lab10/features/channel_search/application/services/FileService.dart';
import 'package:lab10/features/channel_search/domain/models/ChartDataResult.dart';
import 'package:lab10/features/channel_search/presentation/widgets/DataTableWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../domain/models/ChartData.dart';
import '../screens/HomeScreen.dart';
import '../widgets/LineChartWidget.dart';


class HomeScreenState extends State<HomeScreen> {
  List<List<dynamic>> _data = [];
  ChartDataResult _chartData = ChartDataResult([], 0,0);
  String? _selectedYear;
  List<ChartData> _chartDataValues = [];
  List<DropdownMenuItem<String>>? _dropDownItems;
  bool isLoading = false;
  bool isLoadingChart = false;
  bool showChart = false;
  bool showTable = false;


  void _setLoadingState(bool value) async {
    setState(() {
      isLoading = value;
    });
  }

  void _setLoadingChartState(bool value) async {
    setState(() {
      isLoadingChart = value;
    });
  }

  void _setShowTableState(bool value) async {
    setState(() {
      showTable = value;
    });
  }

  void _setShowChartState(bool value) async {
    setState(() {
      showChart = value;
    });
  }

  Future<void> _pickFile() async {
    _setLoadingState(true);
    List<List<dynamic>> csvData = await FileService().loadCSV();
    ChartDataResult chartData = await FileService().prepareDataForChart(csvData);
    List<DropdownMenuItem<String>> dropDownItems = List<DropdownMenuItem<String>>.generate(chartData.maxYear-chartData.minYear, (counter) => DropdownMenuItem(value:'${chartData.minYear+1+counter}',child: Text("${_chartData.minYear+1+counter}")));
    dropDownItems.add(DropdownMenuItem(value: 'all',child: Text('весь период')));

      setState(() {
        _data = csvData;
        _chartData = chartData;
        _chartDataValues= chartData.chartData;
        _dropDownItems = dropDownItems;
        showTable = true;
      });
    _setLoadingState(false);
  }

  Future<void> _filterChartDataByYear(String selectedYear) async {
    List<ChartData> filteredChartData = await ChartService().filterChartDataByYear(_chartData.chartData, int.parse(selectedYear));
    setState(() {
      _chartDataValues = filteredChartData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Нажмите на кнопку, чтобы выбрать данные котировок',
                ),
                // if(showChart) LineChartSample(),
                if(_data.length > 0 && !showChart) ElevatedButton(onPressed: () {
                  _setShowTableState(false);
                  _setShowChartState(true);
                }, child: Text('показать график')),
                if(showTable) DataTableWidget(data: _data),
                if(showChart) Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          DropdownButton<String>(
                            value: _selectedYear,
                            items: _dropDownItems,
                            onChanged: (String? selectedValue){
                              setState(() {
                                print('selected: ${selectedValue}');
                                if(selectedValue != null){
                                  _selectedYear = selectedValue;
                                  _filterChartDataByYear(selectedValue);
                                }
                              });
                            },
                          ),
                          ElevatedButton(
                              onPressed: (){
                                _setLoadingChartState(true);
                                },
                              child: Text("загрузка"))

                        ]
                    ),
                    isLoadingChart ? CircularProgressIndicator(color:Colors.deepOrange) : LineChartWidget(_chartDataValues),

                  ],
                ),

              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setShowChartState(false);
          _pickFile();
        },
        tooltip: 'Выбрать файл',
        child: isLoading ? CircularProgressIndicator(color:Colors.deepOrange) : const Icon(Icons.file_download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}