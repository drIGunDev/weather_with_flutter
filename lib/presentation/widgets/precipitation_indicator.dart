import 'package:flutter/material.dart';

class const PrecipitationIndicator({
  super.key,
  required final int _level,
  final Color? _segmentColor = Colors.blue,
  final Color? _backgroundColor = Colors.white,
  final int _segments = 5,
  final int _gap = 1,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final w = constraint.maxWidth;
        final h = constraint.maxHeight / _segments;
        return Stack(
          children: [
            for (int i = 0; i < _segments; i++)
              Positioned(
                left: 0,
                top: i * h,
                child: Container(
                  width: w,
                  height: h - _gap,
                  decoration: BoxDecoration(
                    color: _segments - i > _level ? _backgroundColor : _segmentColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _Test extends StatefulWidget {
  const _Test({super.key});

  @override
  State<_Test> createState() => _TestState();
}

class _TestState extends State<_Test> {
  int _level = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          SizedBox(
            width: 30,
            height: 40,
            child: PrecipitationIndicator(
              level: _level,
              segments: 5,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _level++;
              });
            },
            child: Text('+'),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _level--;
              });
            },
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: _Test(),
    ),
  ),
);
