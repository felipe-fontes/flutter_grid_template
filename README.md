
  
# Flutter Grid Template  
  


This is a plugin for flutter inspired in the CSS grid template.  
It consists of two Widgets GridTemplate and GridTemplateResponsive.  
and every cell is a container that holds your widget.  
  
The main idea is to help you create a responsive flutter app without the need to use a completely different widget for different screen sizes.

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
	debugPaint:  true,
	template: [
		'logo header',
		'leftContent rightContent',
	],
	rowsSize:  '30% 70%',
	columnsSize:  '2fr 1fr',
	children:  <Widget>[
		Text(
			'Logo Area',
			key:  Key('logo'),
		),
		Text(
			'header Area',
			key:  Key('header'),
		),
		Text(
			'Left Content Area',
			key:  Key('leftContent'),
		),
		Text(
			'Right Content Area',
			key:  Key('rightContent'),
		),
	],
);  
```
  
<img src="https://i.imgur.com/Op3A52z.png" width="400">
  

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
	debugPaint:  true,
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
<img src="https://i.imgur.com/xOUbPyt.png" width="400">
<img src="https://i.imgur.com/gdqlEPu.png" width="400">

 
## Issues and feedback  
Please file [issues](https://github.com/Tedyz/flutter_grid_template/issues/new)  
to send feedback or report a bug. Thank you!
