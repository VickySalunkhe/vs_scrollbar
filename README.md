# vs_scrollbar

A Custom ScrollBar for both Horizontal and Vertical list, you can adjust scrollbar's thickness, radius and set custom colors, with prebuilt methods of default ScrollBar for Flutter.

Wrap This ScrollBar to any ScrollableList.  
```SingleChildScrollView```  
```ListView```  
```Listview.builder```

### Example 
Try out example code all parameters are optional, currently serving basic use case scenarios.

## Horizontal List
![](https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/horizontal.gif)


## Vertical List
![](https://github.com/VickySalunkhe/vs_scrollbar/blob/main/example/assets/vertical.gif)

### Code

```dart
VsScrollbar(
   controller: ScrollController(),
   color: Colors.purple[900], // sets color of vsScrollBar
   isAlwaysShown: true, // default false
   radius: 50, // sets radius of vsScrollBar
   thickness: 6, // sets thickness of vsScrollBar
   child: ListView.builder(
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
