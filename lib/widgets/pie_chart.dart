import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:store_responsive_dashboard/constaints.dart';

class MyPieChart extends StatelessWidget {
  final String selectedPeriod;

  const MyPieChart({Key? key, required this.selectedPeriod}) : super(key: key);

  List<PieChartSectionData> getChartSections(
      BuildContext context, double radius) {
    switch (selectedPeriod) {
      case 'Weekly':
        return [
          PieChartSectionData(
              color: Theme.of(context).primaryColor,
              value: 60,
              radius: radius,
              showTitle: false),
          PieChartSectionData(
            color: Color(0xffCCECDF),
            value: 40,
            radius: radius,
            showTitle: false,
          ),
        ];
      case 'Monthly':
        return [
          PieChartSectionData(
              color: Theme.of(context).primaryColor,
              value: 75,
              radius: radius,
              showTitle: false),
          PieChartSectionData(
            color: Color(0xffCCECDF),
            value: 25,
            radius: radius,
            showTitle: false,
          ),
        ];
      case 'Yearly':
        return [
          PieChartSectionData(
              color: Theme.of(context).primaryColor,
              value: 80,
              radius: radius,
              showTitle: false),
          PieChartSectionData(
            color: Color(0xffCCECDF),
            value: 20,
            radius: radius,
            showTitle: false,
          ),
        ];
      default:
        return [];
    }
  }

  String getCenterText() {
    switch (selectedPeriod) {
      case 'Weekly':
        return '60%';
      case 'Monthly':
        return '75%';
      case 'Yearly':
        return '80%';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                    sections: getChartSections(
                        context, _size.width >= screenMd ? 40 : 20),
                    startDegreeOffset: 270),
              ),
              Center(
                child: Text(
                  getCenterText(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Color(0xffCCECDF),
                                    borderRadius: BorderRadius.circular(50))),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(50))),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              getCenterText().replaceAll('%', ''),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Completed',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}