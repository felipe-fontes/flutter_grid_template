
# Flutter Grid Template

This is a plugin for flutter inspired in the css grid template

## Usage

### Import the package
To use this plugin, follow the [plugin installation instructions](https://pub.dartlang.org/packages/flutter_grid_template#pub-pkg-tab-installing).

### Use the plugin
Add the following import to your Dart code:

```dart
import 'package:flutter_grid_template/grid_template.dart';
```

```dart
GridTemplate(
	key:  Key('b'),
	template: [
		'title sub1',
		'sub3 sub4',
	],
	rowsSize:  '1fr 1fr',
	columnsSize:  '1fr 1fr',
	children:  <Widget>[
		Text(
			'sub grid text 1',
			key:  Key('sub1'),
		),
		Text(
			'sub grid text 2',
			key:  Key('sub2'),
		),
		Text(
			'sub grid text 3',
			key:  Key('sub3'),
		),
		Text(
			'sub grid text 4',
			key:  Key('sub4'),
		),
	],
);
```

!https://imgur.com/a/5fPi1og

## Row and Column Size 
It's importante to notice that you have to put a space between the sizes to specify each row and each column.

## Row and Column Size Types Examples
fr - stands for fraction,
50% - for half of the parent
30 - raw flutter size

Note - Fraction and percentages will take raw size in consideration taking the remaining space as the 100%. 


## Row and Column Span

## Issues and feedback

Please file [issues](https://github.com/Tedyz/flutter_grid_template/issues/new)
to send feedback or report a bug. Thank you!
