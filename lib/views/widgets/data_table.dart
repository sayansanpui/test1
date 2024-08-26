import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DataTable_ extends StatelessWidget {
  // Example data for columns
  final List<String> columnHeaders;

  // Example data for rows
  final List<Map<String, dynamic>> rowData;

  final double? height;
  final double? width;

  DataTable_(
      {super.key,
      required this.columnHeaders,
      required this.rowData,
      this.height,
      this.width});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      height: 350,
      width: 350,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DataTable(
                headingRowColor:
                    WidgetStateColor.resolveWith((states) => Colors.black),
                headingTextStyle: TextStyle(color: Colors.white),
                columns: columnHeaders.map((header) {
                  return DataColumn(
                    label: Text(header),
                  );
                }).toList(),
                rows: List<DataRow>.generate(
                  rowData.length,
                  (index) => DataRow(
                    color: WidgetStateColor.resolveWith(
                      (states) =>
                          index.isEven ? Colors.white : Colors.grey.shade300,
                    ),
                    cells: columnHeaders.map((header) {
                      return DataCell(
                        Text(
                          rowData[index][header].toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
