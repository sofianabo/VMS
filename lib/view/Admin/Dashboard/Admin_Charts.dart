import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vms_school/Link/Model/AdminModel/Dashboard_Model.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({Key? key, required this.data, required this.headerText})
      : super(key: key);

  final List<Map<String, dynamic>> data;
  final String headerText;
  final Color barBackgroundColor = Colors.black.withOpacity(0.3);
  final Color barColor = Color(0xff134B70);
  final Color touchedBarColor = Color(0xff3E8F98);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 20),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset - 50,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              Text(
                widget.headerText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, size: 20),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset + 50,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: SizedBox(
              width: widget.data.length * 50.0, // Adjust the width dynamically
              child: BarChart(
                mainBarData(),
                duration: animDuration,
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: BorderSide.none,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(widget.data.length, (i) {
      final percent = double.tryParse(widget.data[i]['percent']) ?? 0.0;
      return makeGroupData(i, percent, isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final country = widget.data[groupIndex]['countryName'] as String;
            return BarTooltipItem(
              '$country\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${(rod.toY - 1).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (event, barTouchResponse) {
          setState(() {
            if (barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index < widget.data.length) {
                return Text(
                  widget.data[index]['countryName'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              }
              return const Text('');
            },
            reservedSize: 28,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }
}

List<Map<String, dynamic>> convertNumberOfStudentsPerYearToWidgetData(
    NumberOfStudentsThisYear? numberOfStudentsPerYear) {
  if (numberOfStudentsPerYear == null) {
    return [];
  }

  return [
    {
      'countryName': numberOfStudentsPerYear.countryName ?? 'Unknown',
      'percent': numberOfStudentsPerYear.percent?.toString() ?? '0',
    }
  ];
}

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({Key? key, required this.data, required this.headerText})
      : super(key: key);

  final List<Map<String, dynamic>> data;
  final String headerText;
  final Color barBackgroundColor = Colors.black.withOpacity(0.3);
  final Color barColor = Color(0xff3E8F98);
  final Color touchedBarColor = Color(0xff134B70);

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 20),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset - 50,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              Text(
                widget.headerText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, size: 20),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset + 50,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: SizedBox(
              width: widget.data.length * 50.0, // Adjust the width dynamically
              child: BarChart(
                mainBarData(),
                duration: animDuration,
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: BorderSide.none,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(widget.data.length, (i) {
      final percent = double.tryParse(widget.data[i]['percent']) ?? 0.0;
      return makeGroupData(i, percent, isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final country = widget.data[groupIndex]['countryName'] as String;
            return BarTooltipItem(
              '$country\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${(rod.toY - 1).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (event, barTouchResponse) {
          setState(() {
            if (barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index < widget.data.length) {
                return Text(
                  widget.data[index]['countryName'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              }
              return const Text('');
            },
            reservedSize: 28,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }
}
