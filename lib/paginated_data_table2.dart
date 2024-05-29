import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/models/data.dart';
import 'package:paginated_data_table_example/models/models.dart';

class PaginatedTable2 extends StatefulWidget {
  const PaginatedTable2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PaginatedTable2> createState() => _PaginatedTable2State();
}

class _PaginatedTable2State extends State<PaginatedTable2> {
  bool sort = true;
  List<DataModel>? filterData;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      if (ascending) {
        filterData!.sort((a, b) => a.name.compareTo(b.name));
      } else {
        filterData!.sort((a, b) => b.name.compareTo(a.name));
        print('false');
      }
    }
    print('sort');
  }

  @override
  void initState() {
    filterData = myData;
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Theme(
                      data: ThemeData.light()
                          .copyWith(cardColor: Theme.of(context).canvasColor),
                      child: PaginatedDataTable(
                        sortColumnIndex: 0,
                        sortAscending: sort,
                        header: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                                hintText: "Enter something to filter"),
                            onChanged: (value) {
                              setState(() {
                                myData = filterData!
                                    .where((element) =>
                                        element.name!.contains(value))
                                    .toList();
                              });
                            },
                          ),
                        ),
                        source: RowSource(
                          myData: myData,
                          count: myData.length,
                        ),
                        rowsPerPage: 8,
                        columnSpacing: 8,
                        columns: [
                          const DataColumn(
                            label: Text(
                              "ID",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          DataColumn(
                              label: const Text(
                                "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                });

                                onsortColum(columnIndex, sort);
                              }),
                          const DataColumn(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Flutter Paginated DataTable With \n\n Sorting \n\n Filtering \n\n Pagination",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 5),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.id.toString())),
      DataCell(Text(data.name)),
      DataCell(Text(data.email)),
    ],
  );
}
