import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store_responsive_dashboard/model.dart';
import 'package:store_responsive_dashboard/widgets/status_card.dart';
import '../constaints.dart';

class StatusList extends StatefulWidget {
  final String selectedPeriod;
  final Function(String) onPeriodChanged;

  StatusList({Key? key, required this.selectedPeriod, required this.onPeriodChanged}) : super(key: key);

  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  final List<PatientStatus> weeklyStatusList = [
    PatientStatus('Total Games Played', '30', Icons.sports_esports_outlined),
    PatientStatus('Games Completed', '20', Icons.check_circle_outline),
    PatientStatus('Upcoming Sessions', '2', Icons.calendar_today_outlined),
    PatientStatus('Overall Progress', '60%', Icons.show_chart_outlined),
  ];

  final List<PatientStatus> monthlyStatusList = [
    PatientStatus('Total Games Played', '120', Icons.sports_esports_outlined),
    PatientStatus('Games Completed', '85', Icons.check_circle_outline),
    PatientStatus('Upcoming Sessions', '3', Icons.calendar_today_outlined),
    PatientStatus('Overall Progress', '75%', Icons.show_chart_outlined),
  ];

  final List<PatientStatus> yearlyStatusList = [
    PatientStatus('Total Games Played', '1500', Icons.sports_esports_outlined),
    PatientStatus('Games Completed', '1200', Icons.check_circle_outline),
    PatientStatus('Upcoming Sessions', '10', Icons.calendar_today_outlined),
    PatientStatus('Overall Progress', '90%', Icons.show_chart_outlined),
  ];

  List<PatientStatus> get currentStatusList {
    switch (widget.selectedPeriod) {
      case 'Weekly':
        return weeklyStatusList;
      case 'Monthly':
        return monthlyStatusList;
      case 'Yearly':
        return yearlyStatusList;
      default:
        return monthlyStatusList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            _buildPeriodButton('Weekly'),
            SizedBox(width: 14),
            _buildPeriodButton('Monthly'),
            SizedBox(width: 14),
            _buildPeriodButton('Yearly'),
          ],
        ),
        SizedBox(height: componentPadding),
        StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: componentPadding,
          crossAxisSpacing: componentPadding,
          itemCount: currentStatusList.length,
          itemBuilder: (context, index) => StatusCard(currentStatusList[index]),
          staggeredTileBuilder: (index) {
            if (_size.width > screenXxl) return StaggeredTile.fit(1);
            if (_size.width > screenSm) return StaggeredTile.fit(2);
            return StaggeredTile.fit(4);
          },
        )
      ],
    );
  }

  Widget _buildPeriodButton(String period) {
    return InkWell(
      onTap: () {
        widget.onPeriodChanged(period);
      },
      child: Text(
        period,
        style: TextStyle(
          fontSize: 16,
          fontWeight: widget.selectedPeriod == period ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}