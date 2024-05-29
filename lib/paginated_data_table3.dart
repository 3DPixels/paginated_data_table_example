import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/models/data.dart';
import 'package:paginated_data_table_example/models/models.dart';

class PaginatedDataTable3 extends StatefulWidget {
  const PaginatedDataTable3({super.key});

  @override
  State<PaginatedDataTable3> createState() => _PaginatedDataTable3State();
}

class _PaginatedDataTable3State extends State<PaginatedDataTable3> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      scrollbarOrientation: ScrollbarOrientation.bottom,
      child: PaginatedDataTable(
        header: const Text('Orders Table'),
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
