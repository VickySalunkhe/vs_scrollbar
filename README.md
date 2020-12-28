# vs_scrollbar

Customizable ScrollBar that can be dragged for quick navigation supporting both Horizontal and Vertical list.
You can adjust scrollbar's ```thickness```, ```radius```, set custom ```colors``` and handle support for list drag functionality with prebuilt methods of default ScrollBar for Flutter.

Wrap This ScrollBar to any ScrollableList.  
```SingleChildScrollView```  
```ListView```  
```Listview.builder```

## Example 
Try out example code all parameters are optional, currently serving basic use case scenarios.

|                                  Horizontal List                                       |                           Vertical List                                |
| <img src="https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/horizontal.webp" width="300"> | <img src="https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/vertical.webp" width="300"> | 


### Code

```dart
ScrollController _scrollController = ScrollController();

VsScrollbar(
   controller: _scrollController,
   allowDrag: true, // allows to scroll the list using scrollbar [default : true]
   color: Colors.purple[900], // sets color of vsScrollBar
   radius: 50, // sets radius of vsScrollBar
   thickness: 8, // sets thickness of vsScrollBar
   isAlwaysShown: true, // default false
   child: ListView.builder(
             controller: _scrollController, // use same scrollController object to support drag functionality
             shrinkWrap: true,
             physics: BouncingScrollPhysics(),
             itemCount: 6,
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

### Show some :heart: and star the repo.

[![GitHub followers](https://img.shields.io/github/followers/VickySalunkhe.svg?style=social&label=Follow)](https://github.com/VickySalunkhe)
[![Twitter Follow](https://img.shields.io/twitter/follow/VickySalunkhe.svg?style=social)](https://twitter.com/vickysalunkhe01)

---

### :heart: Found this project useful?

If you found this project useful, then please consider giving it a :star: on Github and sharing it with your friends via social media.

---

<a href="https://www.buymeacoffee.com/VickySalunkhe" target="_blank"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=VickySalunkhe&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00"></a>

---

