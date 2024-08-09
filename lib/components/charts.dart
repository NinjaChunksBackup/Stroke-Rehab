import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:store_responsive_dashboard/widgets/bar_chart.dart';
import 'package:store_responsive_dashboard/widgets/pie_chart.dart';

class Charts extends StatelessWidget {
  final String selectedPeriod;

  const Charts({Key? key, required this.selectedPeriod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= screenLg) {
      return Row(
        children: [
          Flexible(flex: 1, child: BarChartSample(selectedPeriod: selectedPeriod)),
          SizedBox(
            width: componentPadding,
          ),
          Flexible(
            flex: 1,
            child: MyPieChart(selectedPeriod: selectedPeriod),
          ),
        ],
      );
    }

    return Column(
      children: [
        BarChartSample(selectedPeriod: selectedPeriod),
        SizedBox(
          height: componentPadding,
        ),
        MyPieChart(selectedPeriod: selectedPeriod),
      ],
    );
  }
}