import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import '../model.dart';

class OrderTable extends StatelessWidget {
  final String selectedPeriod;

  const OrderTable({Key? key, required this.selectedPeriod}) : super(key: key);

  List<History> get orders {
    switch (selectedPeriod) {
      case 'Weekly':
        return weeklyOrders;
      case 'Monthly':
        return monthlyOrders;
      case 'Yearly':
        return yearlyOrders;
      default:
        return monthlyOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DataColumn> columns =
        columnNames.map((e) => DataColumn(label: Text(e))).toList();
    final List<DataRow> rows = orders
        .map((History) => DataRow(cells: [
              DataCell(Row(
                children: [
                  Container(
                    child: Icon(
                      History.icon,
                      color: Theme.of(context).primaryColor,
                    ),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 14,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(147, 198, 176, 0.2))
                        ]),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      History.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                  )
                ],
              )),
              DataCell(Text(
                History.packs.toString() + ' Times',
              )),
              DataCell(Text(
                History.date,
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataCell(Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Text(
                      History.status,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  )))
            ]))
        .toList();
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: DataTable(
        dataRowMinHeight: 70,
        dataRowMaxHeight: 70,
        columns: columns,
        columnSpacing: 6,
        rows: rows,
        headingRowHeight: 0,
        dividerThickness: 0,
      ),
    );
  }
}

final weeklyOrders = <History>[
  History(Icons.sports_esports_outlined, 'Hand Coordination Game', 1, 'Played', '05/08/2024'),
  History(Icons.videogame_asset_outlined, 'Cognitive Challenge Game', 2, 'Played', '06/08/2024'),
  History(Icons.gamepad_outlined, 'Memory Puzzle Game', 1, 'Played', '07/08/2024'),
];

final monthlyOrders = <History>[
  History(Icons.sports_esports_outlined, 'Hand Coordination Game', 2, 'Played', '12/07/2024'),
  History(Icons.videogame_asset_outlined, 'Cognitive Challenge Game', 3, 'Played', '19/07/2024'),
  History(Icons.gamepad_outlined, 'Memory Puzzle Game', 4, 'Played', '26/07/2024'),
  History(Icons.sports_tennis_outlined, 'Physical Exercise Game', 6, 'Played', '02/08/2024'),
  History(Icons.sports_esports_outlined, 'Reaction Time Game', 2, 'Played', '05/08/2024'),
];

final yearlyOrders = <History>[
  History(Icons.sports_esports_outlined, 'Hand Coordination Game', 24, 'Played', 'Jan-Dec 2024'),
  History(Icons.videogame_asset_outlined, 'Cognitive Challenge Game', 36, 'Played', 'Jan-Dec 2024'),
  History(Icons.gamepad_outlined, 'Memory Puzzle Game', 48, 'Played', 'Jan-Dec 2024'),
  History(Icons.sports_tennis_outlined, 'Physical Exercise Game', 72, 'Played', 'Jan-Dec 2024'),
  History(Icons.sports_esports_outlined, 'Reaction Time Game', 24, 'Played', 'Jan-Dec 2024'),
];

final columnNames = ['', '', 'Time', ''];