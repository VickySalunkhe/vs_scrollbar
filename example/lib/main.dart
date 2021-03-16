import 'package:flutter/material.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VsScrollBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _verticalList = true;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text("'Flutter vsScrollBar Demo'"),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => setState(() => _verticalList = true),
                    child: Text("Vertical List")),
                ElevatedButton(
                    onPressed: () => setState(() => _verticalList = false),
                    child: Text("Horizontal List")),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: _verticalList
                  ? MediaQuery.of(context).size.height - 250
                  : 150,
              child: VsScrollbar(
                controller: _scrollController,
                showTrackOnHover: true, // default false
                isAlwaysShown: true, // default false
                scrollbarFadeDuration: Duration(
                    milliseconds: 500), // default : Duration(milliseconds: 300)
                scrollbarTimeToFade: Duration(
                    milliseconds: 800), // default : Duration(milliseconds: 600)
                style: VsScrollbarStyle(
                  hoverThickness: 10.0, // default 12.0
                  radius: Radius.circular(10), // default Radius.circular(8.0)
                  thickness: 10.0, // default 8.0
                  color: Colors.purple.shade900, // default ColorScheme Theme
                ),
                child: ListView.builder(
                    controller:
                        _scrollController, // use same scrollController object to support drag functionality
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection:
                        _verticalList ? Axis.vertical : Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.purple[900],
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20));
                    }),
              ),
            )
          ],
        ));
  }
}
