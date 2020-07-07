/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import 'package:flutter_examples/model/model.dart';
import 'package:flutter_examples/widgets/checkbox.dart';
import 'package:flutter_examples/widgets/customDropDown.dart';
import 'package:flutter_examples/widgets/shared/mobile.dart'
    if (dart.library.html) 'package:flutter_examples/widgets/shared/web.dart';
import '../../../model/sample_view.dart';

/// Renders the cartesian legend with various opdations sample.
class CartesianLegendOptions extends SampleView {
  const CartesianLegendOptions(Key key) : super(key: key);

  @override
  _CartesianLegendOptionsState createState() => _CartesianLegendOptionsState();
}

/// State class of the cartesian legend with various opdations sample.
class _CartesianLegendOptionsState extends SampleViewState {
  _CartesianLegendOptionsState();

  bool toggleVisibility;
  final List<String> _positionList =
      <String>['auto', 'bottom', 'left', 'right', 'top'].toList();
  String _selectedPosition;
  LegendPosition _position;
  final List<String> _modeList = <String>['wrap', 'scroll', 'none'].toList();
  String _selectedMode;
  LegendItemOverflowMode _overflowMode;

  @override
  void initState() {
    _selectedPosition = 'auto';
    _position = LegendPosition.auto;
    _selectedMode = 'wrap';
    _overflowMode = LegendItemOverflowMode.wrap;
    toggleVisibility = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getCartesianLegendOptionsChart();
  }

  @override
  Widget buildSettings(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text('Position ',
                  style: TextStyle(
                      color: model.textColor,
                      fontSize: 16,
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                height: 50,
                width: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: model.bottomSheetBackgroundColor),
                      child: DropDown(
                          value: _selectedPosition,
                          item: _positionList.map((String value) {
                            return DropdownMenuItem<String>(
                                value: (value != null) ? value : 'auto',
                                child: Text('$value',
                                    style: TextStyle(color: model.textColor)));
                          }).toList(),
                          valueChanged: (dynamic value) {
                            onPositionTypeChange(value.toString());
                          })),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Text('Overflow mode',
                  style: TextStyle(
                      color: model.textColor,
                      fontSize: 16,
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                height: 50,
                width: 150,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: model.bottomSheetBackgroundColor),
                      child: DropDown(
                          value: _selectedMode,
                          item: _modeList.map((String value) {
                            return DropdownMenuItem<String>(
                                value: (value != null) ? value : 'wrap',
                                child: Text('$value',
                                    style: TextStyle(color: model.textColor)));
                          }).toList(),
                          valueChanged: (dynamic value) {
                            onModeTypeChange(value);
                          })),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Text('Toggle visibility ',
                  style: TextStyle(
                      color: model.textColor,
                      fontSize: 16,
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HandCursor(
                  child: BottomSheetCheckbox(
                    activeColor: model.backgroundColor,
                    switchValue: toggleVisibility,
                    valueChanged: (dynamic value) {
                      setState(() {
                        toggleVisibility = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns the stacked line chart with various legedn modification options.
  SfCartesianChart getCartesianLegendOptionsChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Monthly expense of a family'),
      /// Legend and its options for cartesian chart.
      legend: Legend(
          isVisible: !isCardView,
          position: _position,
          overflowMode: _overflowMode,
          toggleSeriesVisibility: toggleVisibility),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelRotation: isCardView ? 0 : -45,
      ),
      primaryYAxis: NumericAxis(
          // maximum: 200,
          axisLine: AxisLine(width: 0),
          labelFormat: '\${value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the stacked line chart.
  List<StackedLineSeries<ChartSampleData, String>> _getStackedLineSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Food', y: 55, yValue: 40, yValue2: 45, yValue3: 48, size: 28),
      ChartSampleData(
          x: 'Transport',
          y: 33,
          yValue: 45,
          yValue2: 54,
          yValue3: 28,
          size: 35),
      ChartSampleData(
          x: 'Medical', y: 43, yValue: 23, yValue2: 20, yValue3: 34, size: 48),
      ChartSampleData(
          x: 'Clothes', y: 32, yValue: 54, yValue2: 23, yValue3: 54, size: 27),
      ChartSampleData(
          x: 'Books', y: 56, yValue: 18, yValue2: 43, yValue3: 55, size: 31),
      ChartSampleData(
          x: 'Others', y: 23, yValue: 54, yValue2: 33, yValue3: 56, size: 35),
    ];
    return <StackedLineSeries<ChartSampleData, String>>[
      StackedLineSeries<ChartSampleData, String>(
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Person 1',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Person 2',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue2,
          name: 'Person 3',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue3,
          name: 'Person 4',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.size,
          name: 'Person 5',
          markerSettings: MarkerSettings(isVisible: true))
    ];
  }

  /// Method to update the selected position type change.
  void onPositionTypeChange(String item) {
    _selectedPosition = item;
    if (_selectedPosition == 'auto') {
      _position = LegendPosition.auto;
    }
    if (_selectedPosition == 'bottom') {
      _position = LegendPosition.bottom;
    }
    if (_selectedPosition == 'right') {
      _position = LegendPosition.right;
    }
    if (_selectedPosition == 'left') {
      _position = LegendPosition.left;
    }
    if (_selectedPosition == 'top') {
      _position = LegendPosition.top;
    }
    setState(() {});
  }

  /// Method to update the selected overflow mode type change.
  void onModeTypeChange(String item) {
    _selectedMode = item;
    if (_selectedMode == 'wrap') {
      _overflowMode = LegendItemOverflowMode.wrap;
    }
    if (_selectedMode == 'scroll') {
      _overflowMode = LegendItemOverflowMode.scroll;
    }
    if (_selectedMode == 'none') {
      _overflowMode = LegendItemOverflowMode.none;
    }
    setState(() {});
  }
}