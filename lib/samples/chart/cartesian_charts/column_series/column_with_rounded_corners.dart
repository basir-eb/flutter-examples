/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/model.dart';
import '../../../../model/sample_view.dart';

class ColumnRounded extends SampleView {
  const ColumnRounded(Key key) : super(key: key);   

  @override
  _ColumnRoundedState createState() => _ColumnRoundedState();
}

class _ColumnRoundedState extends SampleViewState {
  _ColumnRoundedState();
  

  @override
  Widget build(BuildContext context) {
    return getRoundedColumnChart();
  }

  SfCartesianChart getRoundedColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Land area of various cities (sq.km)'),
      primaryXAxis: CategoryAxis(
        labelStyle: const TextStyle(color: Colors.white),
        axisLine: AxisLine(width: 0),
        labelPosition: ChartDataLabelPosition.inside,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(isVisible: false, minimum: 0, maximum: 9000),
      series: getRoundedColumnSeries(),
      tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: false,
          format: 'point.x : point.y sq.km',
          header: ''),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> getRoundedColumnSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'New York', y: 8683),
      ChartSampleData(x: 'Tokyo', y: 6993),
      ChartSampleData(x: 'Chicago', y: 5498),
      ChartSampleData(x: 'Atlanta', y: 5083),
      ChartSampleData(x: 'Boston', y: 4497),
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        enableTooltip: true,
        width: 0.9,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        dataSource: chartData,
        /// If we set the border radius value for column series, then the series will appear as rounder corner.
        borderRadius: BorderRadius.circular(10),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}
