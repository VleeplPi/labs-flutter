import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

import '../../domain/models/ChartData.dart';
import '../../domain/models/ChartDataSourceItem.dart';

final class FileService {
  Future<List<List<dynamic>>> loadCSV() async {
    // final csvData = await rootBundle.loadString(path);
    List<List<dynamic>> data = [];
    String text;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        print('${result.files.single.path}');
        String filePath = result.files.single.path ?? "";
        File file = File(filePath);
        String csvData = await file.readAsString();
        data = CsvToListConverter().convert(csvData);
      }
      // final File file = File('${directory.path}/${directory.uri}');
      // text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    finally {
      return data;
    }
  }

  Future<ChartDataResult> prepareDataForChart(List<List<dynamic>> csvTable) async {
    List<ChartData> chartData = [];
    String initVal = csvTable[1][2].toString();
    String initDate = initVal.length < 6 ? '0${initVal}' : initVal;
    int minYear =  2000 + int.parse(initDate.substring(4, 6));;
    int maxYear = 0;
    for (var row in csvTable.skip(1)) {
      String tmpDate = row[2].toString();
      String date = tmpDate.length < 6 ? '0${tmpDate}' : tmpDate;
      double close = double.parse(row[4].toString());
      // Перевод строки в с датой в формат DateTime
      int day = int.parse(date.substring(0, 2));
      int month = int.parse(date.substring(2, 4));
      int year = 2000 + int.parse(date.substring(4, 6));
      if(year > maxYear){
        maxYear = year;
      }
      if(year < minYear){
        minYear = year;
      }
      DateTime dateTime = DateTime(year, month, day);
      String label = csvTable[1][0].toString();
      chartData.add(ChartData(dateTime, close, label));
    }
    print("Min Year: ${minYear}\nMax Year: ${maxYear}");
    return ChartDataResult(chartData, minYear, maxYear);
  }
}