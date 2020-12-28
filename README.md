# vs_scrollbar

[![Pub](https://img.shields.io/pub/v/vs_scrollbar.svg)](https://pub.dartlang.org/packages/vs_scrollbar)

Customizable ScrollBar that can be dragged for quick navigation supporting both Horizontal and Vertical list.

You can adjust scrollbar's ```thickness```, ```radius```, set custom ```colors``` and handle support for list drag functionality with prebuilt methods of default ScrollBar for Flutter.

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

### Code

```dart
// use same scrollController object to listview and scrollbar to support drag functionality
ScrollController _scrollController = ScrollController();

VsScrollbar(
   controller: _scrollController,
   allowDrag: true, // allows to scroll the list using scrollbar [default : true]
   color: Colors.purple[900], // sets color of vsScrollBar
   radius: 50, // sets radius of vsScrollBar
   thickness: 8, // sets thickness of vsScrollBar
   isAlwaysShown: true, // default false
   child: ListView.builder(
             controller: _scrollController, 
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


<div class="BorderGrid-cell">
              <h2 class="h4 mb-3">
  <a href="/VickySalunkhe/vs_scrollbar/graphs/contributors" class="link-gray-dark no-underline ">
    Contributors <span title="2" class="Counter ">2</span>
</a></h2>
    
  <ul class="list-style-none ">
      <li class="mb-2 d-flex">
        <a class="mr-2" data-hovercard-type="user" data-hovercard-url="/users/VickySalunkhe/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/VickySalunkhe">
          <img class="d-block avatar-user" src="https://avatars3.githubusercontent.com/u/37410248?s=64&amp;v=4" width="32" height="32" alt="@VickySalunkhe">
</a>          <span class="flex-self-center flex-auto min-width-0 css-truncate css-truncate-target width-fit">
            <a class="link-gray-dark no-underline flex-self-center" href="/VickySalunkhe">
              <strong>VickySalunkhe</strong>
              <span class="text-gray">Vicky Salunkhe</span>
</a>          </span>
      </li>
      <li class="mb-2 d-flex">
        <a class="mr-2" data-hovercard-type="user" data-hovercard-url="/users/Bestfastfire/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Bestfastfire">
          <img class="d-block avatar-user" src="https://avatars0.githubusercontent.com/u/22732544?s=64&amp;v=4" width="32" height="32" alt="@Bestfastfire">
</a>          <span class="flex-self-center flex-auto min-width-0 css-truncate css-truncate-target width-fit">
            <a class="link-gray-dark no-underline flex-self-center" href="/Bestfastfire">
              <strong>Bestfastfire</strong>
              <span class="text-gray">Woton Sampaio</span>
</a>          </span>
      </li>
  </ul>

