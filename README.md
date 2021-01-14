# vs_scrollbar

[![Pub](https://img.shields.io/pub/v/vs_scrollbar.svg)](https://pub.dartlang.org/packages/vs_scrollbar)


## Table of Contents

- [Installing](#installing) - How to install
- [Example](#example) - How this plugin works
- [Code example](#code-example) - How to use
- [VsScrollBar object properties](#vsscrollbar-object-properties) - Modifying your VsScrollBar

## Installing

Add to pubspec.yaml file

```sh
dependencies:
  vs_scrollbar: ^0.1.2
```

Import

```sh
import 'package:vs_scrollbar/vs_scrollbar.dart';
```

Customizable ScrollBar that can be dragged for quick navigation supporting both Horizontal and Vertical list.

You can adjust scrollbar's ```thickness```, ```radius```, set custom ```colors``` and handle support for list drag functionality with prebuilt methods of default ScrollBar for Flutter.

Control animation duration of scrollbar using scrollbarTimeToFade, scrollbarFadeDuration properties.

Wrap This ScrollBar to any ScrollableList.  
```SingleChildScrollView```  
```ListView```  
```Listview.builder```

## Example 
Try out example code all parameters are optional, currently serving basic use case scenarios.

## Horizontal List

![](https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/horizontal.webp)

---

## Vertical List
![](https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/vertical.webp)

### Code example

```dart
// use same scrollController object to listview and scrollbar to support drag functionality
ScrollController _scrollController = ScrollController();

VsScrollbar(
   controller: _scrollController,
   scrollDirection: Axis.vertical, // @REQUIRED
   allowDrag: true, // allows to scroll the list using scrollbar [default : true]
   color: Colors.purple[900], // sets color of vsScrollBar
   radius: 50, // sets radius of vsScrollBar
   thickness: 8, // sets thickness of vsScrollBar
   isAlwaysShown: true, // default false
   // sets scrollbar fade duration [ Default : Duration(milliseconds: 300)]
   scrollbarFadeDuration: Duration(milliseconds:500), 
   // sets scrollbar fade duration [ Default : Duration(milliseconds: 600)]
   scrollbarTimeToFade: Duration(milliseconds:800), 
   child: ListView.builder(
             controller: _scrollController, 
             shrinkWrap: true,
             physics: BouncingScrollPhysics(),
             itemCount: 6,
             scrollDirection: Axis.vertical,
             itemBuilder: (BuildContext context, int index) {
                   return Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.purple[900],
                          margin: EdgeInsets.all(15));
             },
   ),
)
```
---


## VsScrollbar object properties

| Name                    | Type                | Default                               | Description                                                                  |
| ----------------------- | ------------------- | ------------------------------------- | ---------------------------------------------------------------------------- |
| controller              | `ScrollController`  | null                                  | Controller for Scrollbar                                                     |
| scrollDirection         | `Axis`              | null                                  | Needed for supporting Drag functionality to work properly                    |
| allowDrag               | `bool`              | true                                  | Allows to scroll the list using scrollbar                                    |
| color                   | `Color`             | Colors.grey                           | ScrollBar Color                                                              |
| radius                  | `double`            | 50                                    | Set Radius of ScrollBar                                                      |
| thickness               | `double`            | 8                                     | Set Thickness of ScrollBar                                                   |
| scrollbarFadeDuration   | `Duration`          | Duration(milliseconds: 300)           | Sets scrollbar fade animation duration                                       |
| scrollbarTimeToFade     | `Duration`          | Duration(milliseconds: 600)           | Fades scrollbar after certain duration                                       |

---

## Pull request and feedback are always appreciated :)

---

### Show some :heart: and star the repo.

[![GitHub followers](https://img.shields.io/github/followers/VickySalunkhe.svg?style=social&label=Follow)](https://github.com/VickySalunkhe)
[![Twitter Follow](https://img.shields.io/twitter/follow/VickySalunkhe.svg?style=social)](https://twitter.com/vickysalunkhe01)

---

### :heart: Found this project useful?

If you found this project useful, then please consider giving it a :star: on Github and sharing it with your friends via social media.

---

<a href="https://www.buymeacoffee.com/VickySalunkhe" target="_blank"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=VickySalunkhe&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00"></a>

---


