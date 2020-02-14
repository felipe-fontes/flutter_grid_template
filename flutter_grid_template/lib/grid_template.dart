import 'dart:math';
import 'package:flutter/material.dart';

class GridTemplate extends StatelessWidget {
  GridTemplate({
    Key key,
    @required this.template,
    @required this.children,
    @required this.rowsSize,
    @required this.columnsSize,
    this.debugPaint = false,
  }) : super(key: key);

  final List<String> template;
  final List<Widget> children;
  final String columnsSize;
  final String rowsSize;
  final List<double> _rowsSize = List<double>();
  final List<double> _columnsSize = List<double>();
  final bool debugPaint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Stack(
          children: _buildWidgets(constraints.maxWidth, constraints.maxHeight),
        );
      },
    );
  }

  List<Positioned> _buildWidgets(double maxWidth, double maxHeight) {
    _validateData();
    _calculateColumnsSize(maxWidth);
    _calculateRowsSize(maxHeight);
    var preWidgets = List<PrePositioned>();
    var widgets = List<Positioned>();
    var preWidgetsMatrix = List<List<PrePositioned>>();

    for (var rowIndex = 0; rowIndex < template.length; rowIndex++) {
      preWidgetsMatrix.add(List<PrePositioned>());

      var columnKeys = template[rowIndex].split(" ");
      for (var columnIndex = 0;
          columnIndex < columnKeys.length;
          columnIndex++) {
        var prePositioned = PrePositioned();

        prePositioned.width = _columnsSize[columnIndex];
        prePositioned.height = _rowsSize[rowIndex];
        var columnKey = Key(columnKeys[columnIndex]);

        //top
        if (rowIndex == 0) {
          prePositioned.top = 0;
        } else {
          var prevWidget = preWidgetsMatrix[rowIndex - 1][columnIndex];
          prePositioned.top = prevWidget.top + prevWidget.height;
        }

        //left
        if (columnIndex == 0) {
          prePositioned.left = 0;
        } else {
          var prevWidget = preWidgetsMatrix[rowIndex][columnIndex - 1];
          prePositioned.left = prevWidget.left + prevWidget.width;
        }

        if (columnIndex > 0 &&
            preWidgetsMatrix[rowIndex][columnIndex - 1].child.key ==
                columnKey) {
          prePositioned = preWidgetsMatrix[rowIndex][columnIndex - 1];
          prePositioned.width = prePositioned.width + _columnsSize[columnIndex];
        }

        if (rowIndex > 0 &&
            preWidgetsMatrix[rowIndex - 1][columnIndex].child.key ==
                columnKey) {
          prePositioned = preWidgetsMatrix[rowIndex - 1][columnIndex];
          prePositioned.height = prePositioned.height + _rowsSize[rowIndex];
        }

        prePositioned.child = children.firstWhere(
          (widget) => widget.key == columnKey,
          orElse: () => Container(),
        );

        preWidgets.add(prePositioned);

        preWidgetsMatrix[rowIndex].add(prePositioned);
      }
    }

    widgets =
        preWidgets.map((p) => p.createWidget(debugPaint: debugPaint)).toList();

    return widgets;
  }

  void _calculateColumnsSize(double maxWidth) {
    _columnsSize.clear();
    var strings = columnsSize.split(' ');

    var fractions = _getFractions(strings);
    var fixedWidth = _getFixedValues(strings, maxWidth);

    var sizes = strings.map((s) {
      double size;
      if (s.endsWith('%')) {
        var sub = s.substring(0, s.length - 1);
        var val = double.parse(sub);
        size = ((val / 100) * maxWidth);
      } else if (s.endsWith('fr')) {
        var sub = s.substring(0, s.length - 2);
        var val = double.parse(sub);
        size = ((val / fractions) * (maxWidth - fixedWidth));
      } else {
        size = double.parse(s);
      }

      return size;
    }).toList();

    _columnsSize.addAll(sizes);
  }

  void _calculateRowsSize(double maxHeight) {
    _rowsSize.clear();
    var strings = rowsSize.split(' ');

    var fractions = _getFractions(strings);
    var fixedHeight = _getFixedValues(strings, maxHeight);

    var sizes = strings.map((s) {
      double size;
      if (s.endsWith('%')) {
        var sub = s.substring(0, s.length - 1);
        var val = double.parse(sub);
        size = ((val / 100) * maxHeight);
      } else if (s.endsWith('fr')) {
        var sub = s.substring(0, s.length - 2);
        var val = double.parse(sub);
        size = ((val / fractions) * (maxHeight - fixedHeight));
      } else {
        size = double.parse(s);
      }

      return size;
    }).toList();

    _rowsSize.addAll(sizes);
  }

  _getFractions(List<String> strings) {
    var fractionStrings = strings.where((s) => s.endsWith('fr'));
    if (fractionStrings.length > 0) {
      return fractionStrings
          .map((f) => double.parse(f.substring(0, f.length - 2)))
          .reduce((a, b) => a + b);
    } else
      return 0;
  }

  _getFixedValues(List<String> strings, double maxSize) {
    var fixedWidthsStrings = strings.where((s) => !s.endsWith('fr'));
    if (fixedWidthsStrings.length > 0) {
      return fixedWidthsStrings.map((f) {
        if (f.contains('%')) {
          return double.parse(f.substring(0, f.length - 1)) / 100 * maxSize;
        }
        return double.parse(f);
      }).reduce((a, b) => a + b);
    } else
      return 0;
  }

  _validateData() {
    if (template == null || template.length == 0) {
      throw Exception(
          '${this.runtimeType.toString()} must have a template defined');
    }

    if (rowsSize == null) {
      throw Exception('The parameter rowsSize is required!');
    }

    if (columnsSize == null) {
      throw Exception('The parameter columnsSize is required!');
    }

    var tmp = template[0].split(' ');
    var cs = columnsSize.split(' ');
    if (tmp.length != cs.length) {
      throw Exception(
          'columnsSize should match the template columns | template has ${tmp.length} and columnsSize has ${cs.length}');
    }

    var rs = rowsSize.split(' ');
    if (template.length != rs.length) {
      throw Exception(
          'rowsSize should match the template rows | template has ${template.length} and rowsSize has ${rs.length}');
    }
  }
}

class PrePositioned {
  double left;
  double top;
  double width;
  double height;
  Widget child;

  Positioned createWidget({bool debugPaint = false}) {
    return Positioned(
      top: top,
      left: left,
      width: width,
      height: height,
      child: Container(
        key: child.key,
        child: child,
        color: debugPaint
            ? Color.fromARGB(
                255,
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
              )
            : null,
      ),
    );
  }
}
