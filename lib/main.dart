import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/models/data.dart';
import 'package:paginated_data_table_example/models/models.dart';
import 'package:paginated_data_table_example/paginated_data_table.dart';
import 'package:paginated_data_table_example/paginated_data_table2.dart';
import 'package:paginated_data_table_example/paginated_data_table3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
      ),
      body: SizedBox(
        width: 600,
        height: 600,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _verticalScrollController,
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            scrollDirection: Axis.vertical,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              controller: _horizontalScrollController,
              child: PaginatedDataTable(
                header: const Text('Orders Table'),
                controller: _horizontalScrollController,
                columns: const [
                  DataColumn(label: Text('Sales Order')),
                  DataColumn(label: Text('Sold to Party')),
                  DataColumn(label: Text('Party Name')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Currency')),
                  DataColumn(label: Text('Order Type')),
                  DataColumn(label: Text('Creation Date')),
                  DataColumn(label: Text('Total Net Amount')),
                ],
                source: _DataSource(data: sampleOrders),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<Order> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].salesOrder!)),
      DataCell(Text(data[index].soldToParty!)),
      DataCell(Text(data[index].soldToPartyName!)),
      DataCell(Text(data[index].overallSDProcessStatus!)),
      DataCell(Text(data[index].transactionCurrency!)),
      DataCell(Text(data[index].salesOrderType!)),
      DataCell(Text(data[index].creationDate.toString())),
      DataCell(Text(data[index].totalNetAmount.toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
