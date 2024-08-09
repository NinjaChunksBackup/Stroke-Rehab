import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/components/status_list.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:store_responsive_dashboard/layout/main_layout.dart';
import '../components/history_table.dart';
import '../widgets/bar_chart.dart';
import '../widgets/pie_chart.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _selectedPeriod = 'Monthly';

  void _updateSelectedPeriod(String period) {
    setState(() {
      _selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatusList(
            selectedPeriod: _selectedPeriod,
            onPeriodChanged: _updateSelectedPeriod,
          ),
          SizedBox(height: componentPadding),
          Row(
            children: [
              Expanded(child: BarChartSample(selectedPeriod: _selectedPeriod)),
              SizedBox(width: componentPadding),
              Expanded(child: MyPieChart(selectedPeriod: _selectedPeriod)),
            ],
          ),
          SizedBox(height: componentPadding),
          OrderTable(selectedPeriod: _selectedPeriod),
        ],
      ),
    );
  }
}