# vs_scrollbar  [![Pub](https://img.shields.io/pub/v/vs_scrollbar.svg)](https://pub.dartlang.org/packages/vs_scrollbar)

Customizable ScrollBar that can be dragged for quick navigation supporting both Horizontal and Vertical list.

---

## Table of Contents

- [Installing](#installing) - How to install
- [Package Details](package-details) - Package Details
- [Example](#example) - How this plugin works
- [Code example](#code-example) - How to use
- [VsScrollBar object properties](#vsscrollbar-object-properties) - Modifying your VsScrollBar

---

## Installing

Add to pubspec.yaml file

```sh
dependencies:
  vs_scrollbar: ^0.2.0
```

Import

```sh
import 'package:vs_scrollbar/vs_scrollbar.dart';
```

## Package Details

Customizable ScrollBar that can be dragged for quick navigation supporting both Horizontal and Vertical list.

You can customize scrollbar's ```thickness```, ```radius```, set custom ```colors``` and handle support for list drag functionality with prebuilt methods of default ScrollBar for Flutter.

Control animation duration of scrollbar using scrollbarTimeToFade, scrollbarFadeDuration properties.

Drag Behaviour with scrollbar is by default supported, if ScrollController object is passed.

Wrap This ScrollBar to any ScrollableList.  
```SingleChildScrollView```  
```GridView```  
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
   showTrackOnHover: true,// default false
   isAlwaysShown: true, // default false
   scrollbarFadeDuration: Duration(milliseconds: 500), // default : Duration(milliseconds: 300)
   scrollbarTimeToFade: Duration(milliseconds: 800),// default : Duration(milliseconds: 600)
   style: VsScrollbarStyle(
            hoverThickness: 10.0, // default 12.0
            radius: Radius.circular(10), // default Radius.circular(8.0)
            thickness: 10.0, // [ default 8.0 ]
            color: Colors.purple.shade900, // default ColorScheme Theme
          ),
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

| Name                    | Type                | default                               | Description                                                                  |
| ----------------------- | ------------------- | ------------------------------------- | ---------------------------------------------------------------------------- |
| controller              | `ScrollController`  | null                                  | Controller for Scrollbar                                                     |
| scrollbarFadeDuration   | `Duration`          | Duration(milliseconds: 300)           | Sets scrollbar fade animation duration                                       |
| scrollbarTimeToFade     | `Duration`          | Duration(milliseconds: 600)           | Fades scrollbar after certain duration                                       |
| isAlwaysShown           | `bool`              | false                                 | controls visibility of scrollbar when ideal                                  |
| showTrackOnHover        | `bool`              | false                                 | controls visibility of scrollbar while hovering                              |
| style                   | `VsScrollbarStyle`  | VsScrollbarStyle()                    | Style Class for VsScrollBar                                                  |


## VsScrollbarStyle object properties
| color                   | `Color`             | System ColorScheme Theme              | ScrollBar Color                                                              |
| radius                  | `Radius`            | Radius.circular(8.0)                  | Set Radius of ScrollBar                                                      |
| thickness               | `double`            | 8.0                                   | Set Thickness of ScrollBar                                                   |
| hoverThickness          | `double`            | 12.0                                  | Set Hover Thickness of ScrollBar                                             |

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


