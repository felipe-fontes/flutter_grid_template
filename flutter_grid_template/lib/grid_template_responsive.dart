import 'package:flutter/material.dart';
import 'grid_template.dart';

class GridTemplateResponsive extends StatelessWidget {
  GridTemplateResponsive({
    Key key,
    @required this.templates,
    @required this.children,
    this.debugPaint = false,
  }) : super(key: key);

  final List<TemplateSelector> templates;
  final List<Widget> children;
  final bool debugPaint;

  @override
  Widget build(BuildContext context) {
    return _getTemplate(context);
  }

  _getTemplate(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    TemplateSelector selected;

    var possibles = this.templates.where((t) {
      var result = screenSize.width <= t.maxWidth;
      return result;
    });

    if (possibles.length == 0) {
      selected = templates[0];
    } else {
      selected = possibles.reduce((a, b) => a.maxWidth > b.maxWidth ? b : a);
    }

    return selected.getGridTemplate(children, debugPaint: debugPaint);
  }
}

class TemplateSelector {
  TemplateSelector({
    this.maxWidth = double.maxFinite,
    @required this.template,
    @required this.columnsSize,
    @required this.rowsSize,
  });
  final double maxWidth;
  final List<String> template;
  final String columnsSize;
  final String rowsSize;

  getGridTemplate(List<Widget> children, {bool debugPaint = false}) =>
      GridTemplate(
        children: children,
        template: template,
        rowsSize: rowsSize,
        columnsSize: columnsSize,
        debugPaint: debugPaint,
      );
}
