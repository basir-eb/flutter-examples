import 'package:flutter_examples/model/sample_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class RadialImageAnnotation extends SampleView {
  const RadialImageAnnotation(Key key) : super(key: key);
  
  @override
  _RadialImageAnnotationState createState() =>
      _RadialImageAnnotationState();
}

class _RadialImageAnnotationState extends SampleViewState {
  _RadialImageAnnotationState();
  
  @override
  Widget build(BuildContext context) {
    return getRadialImageAnnotation();
  }

SfRadialGauge getRadialImageAnnotation() {
  return SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
          interval: 10,
          radiusFactor: kIsWeb ? 0.8 : 0.95,
          startAngle: 0,
          endAngle: 360,
          showTicks: false,
          showLabels: false,
          axisLineStyle: AxisLineStyle(thickness: 20),
          pointers: <GaugePointer>[
            RangePointer(
                value: 73,
                width: 20,
                color: const Color(0xFFFFCD60),
                enableAnimation: true,
                gradient: kIsWeb
                    ? null
                    : const SweepGradient(
                        colors: <Color>[Color(0xFFFCE38A), Color(0xFFF38181)],
                        stops: <double>[0.25, 0.75]),
                cornerStyle: CornerStyle.bothCurve)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: isCardView ? 30.00 : 50.00,
                        height: isCardView ? 30.00 : 50.00,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('images/sun.png'),
                            fit: BoxFit.fill,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Container(
                        child: Text('73°F',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isCardView ? 15.00 : 25)),
                      ),
                    )
                  ],
                ),
                angle: 270,
                positionFactor: 0.1)
          ])
    ],
  );
}
}