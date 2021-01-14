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
      home: MyHomePage(title: 'Flutter vsScrollBar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
          title: Text(widget.title),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => setState(() => _verticalList = true),
                    child: Text("Vertical List")),
                RaisedButton(
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
                // @REQUIRED
                scrollDirection: null,
                // _verticalList ? Axis.vertical : Axis.horizontal,
                allowDrag:
                    true, // allows to scroll the list using scrollbar [Default : true]
                color: Colors.purple[900], // sets color of vsScrollBar
                // isAlwaysShown: true, // default false
                radius: 50, // sets radius of vsScrollBar
                thickness: 8, // sets thickness of vsScrollBar
                // sets scrollbar fade duration [ Default : Duration(milliseconds: 300)]
                scrollbarFadeDuration: Duration(milliseconds: 500),
                // sets scrollbar fade duration [ Default : Duration(milliseconds: 600)]
                scrollbarTimeToFade: Duration(milliseconds: 800),
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
