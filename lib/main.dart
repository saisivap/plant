import 'package:flutter/material.dart';
import 'package:plant/plantslist.dart';

void main() {
  runApp(HelloApp());
}

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green[300],
        ),
        backgroundColor: Colors.white,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 30),
            // width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  onPressed: () {},
                  elevation: 0.0,
                  mini: true,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 17.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Top Picks',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: <Widget>[
                BuildTab('Top'),
                BuildTab('Outdoor'),
                BuildTab('Indoor'),
                BuildTab('Plants'),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200.0,

            // child: Text("${MediaQuery.of(context).size.height - 200}"),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                // Text('1st'),
                PlantList(),
                Text('2st'),
                Text('3st'),
                Text('4st'),
              ],
            ),
          ),
        ],
      ),
    );
    // );
  }
}

class BuildTab extends StatelessWidget {
  // const BuildTab({
  //   Key key,
  // }) : super(key: key);
  final String name;
  BuildTab(this.name);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        '${name}',
        style: TextStyle(
            fontSize: 17.0,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
