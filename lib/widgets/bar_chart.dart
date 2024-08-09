import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatefulWidget {
  final String selectedPeriod;

  BarChartSample({Key? key, required this.selectedPeriod}) : super(key: key);

  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 24, right: 24, bottom: 24),
          child: BarChart(
            mainBarData(),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 18,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [Colors.transparent],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    if (widget.selectedPeriod == 'Weekly') {
      return List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 15, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 16.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 10, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });
    } else if (widget.selectedPeriod == 'Monthly') {
      return List.generate(12, (i) {
        return makeGroupData(i, 5 + i * 2.0, isTouched: i == touchedIndex);
      });
    } else { // Yearly
      return List.generate(5, (i) {
        return makeGroupData(i, 10 + i * 5.0, isTouched: i == touchedIndex);
      });
    }
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String title;
              switch (widget.selectedPeriod) {
                case 'Weekly':
                  title = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][group.x.toInt()];
                  break;
                case 'Monthly':
                  title = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][group.x.toInt()];
                  break;
                case 'Yearly':
                  title = (2020 + group.x.toInt()).toString();
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                title + '\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 20,
          getTitles: (double value) {
            switch (widget.selectedPeriod) {
              case 'Weekly':
                return ['M', 'T', 'W', 'T', 'F', 'S', 'S'][value.toInt()];
              case 'Monthly':
                return ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'][value.toInt()];
              case 'Yearly':
                return (2020 + value.toInt()).toString();
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          reservedSize: 40,
          margin: 20,
          interval: 5,
          getTitles: (value) {
            if (value % 5 == 0) {
              return value.toInt().toString();
            }
            return '';
          },
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}