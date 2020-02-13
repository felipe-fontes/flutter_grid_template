
  
# Flutter Grid Template  
  

This is a plugin for flutter inspired in the CSS grid template.
It consists in two Widgets GridTemplate and GridTemplateResponsive.
and every cell is container that holds your widget.

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
	key: Key('b'),  
	template: [  
		'title sub1',  
		'sub3 sub4',  
	],  
	rowsSize: '1fr 1fr',  
	columnsSize: '1fr 1fr',  
	children: <Widget>[  
		Text(  
			'sub grid text 1',  
			key: Key('sub1'),  
		),  
		Text(  
			'sub grid text 2',  
			key: Key('sub2'),  
		),  
		Text(  
			'sub grid text 3',  
			key: Key('sub3'),  
		),  
		Text(  
			'sub grid text 4',  
			key: Key('sub4'),  
		),  
	],  
);  
```  
  

!https://imgur.com/a/5fPi1og  
  

## Row and Column Size  

It's important to notice that you have to put a space between the sizes to specify each row and each column.  
  

## Row and Column Size Types Examples  

fr - stands for fraction,  
50% - for half of the parent  
30 - raw flutter size  
  

Note - Fraction and percentages will consider raw size taking the remaining space as 100%.  
  
  

## Row and Column Span  
  

To use a span you just need to repeat the key inside the template properties  
For row span  

```dart  
template: [  
	'title title',  
	'sub3 sub4',  
],  
```  

For column span  

```dart  
template: [  
	'title sub1',  
	'title sub4',  
],  
```  

Or both  

```dart  
template: [  
	'title title',  
	'title title',  
],  
```  
  

## For GridTemplateResponsive  
You need to pass a TemplateSelector that you can use it to pass the ``` maxWidth``` that each template will work. so if the screen size changes your template you change accordingly.  

```dart
GridTemplateResponsive(
	templates: [
		TemplateSelector(
			template: [
				'test1 test2 test3',
				'test4 test5 test6',
			],
			columnsSize:  '50 50% 50%',
			rowsSize:  '50% 50%',
			maxWidth:  1024,
		),
		TemplateSelector(
			template: [
				'test1 test2',
				'test3 test3',
				'test4 test5',
				'test6 test6',
			],
			columnsSize:  '50 100%',
			rowsSize:  '1fr 1fr 1fr 1fr',
			maxWidth:  768,
		),
	],
	children:  <Widget>[
		Text(
			'Text 1',
			key:  Key('test1'),
		),
		Text(
			'Text 2',
			key:  Key('test2'),
		),
		Text(
			'Text 3',
			key:  Key('test3'),
		),
		Text(
			'Text 4',
			key:  Key('test4'),
		),
		Text(
			'Text 5',
			key:  Key('test5'),
		),
		Text(
			'Text 6',
			key:  Key('test6'),
		),
	],
)
```

!https://imgur.com/gdqlEPu
!https://imgur.com/xOUbPyt
 
## Issues and feedback  
Please file [issues](https://github.com/Tedyz/flutter_grid_template/issues/new)  
to send feedback or report a bug. Thank you!
