import 'dart:ffi';

import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  double o = 0.4; //opacity of button just for fun
  String description;
  List<String> listOfDesc = [
    'Pngtree provides you with 31854 free transparent Plant png, vector, clipart images and psd files. All of these Plant resources are for free download on Pngtree.',
    '27,863 transparent png images related to Plants. Cleanpng provides you with HQ Plants transparent png images, icons and vectors. Browse our Plants collection ...',
    'A shrub or bush is a small to medium-sized woody plant. It is distinguished from a tree by its multiple stems and shorter height, usually under 6 m (20 ft) tall. Plants ...',
    'Are you searching for Potted Plant png images or vector? Choose from 5900+ Potted Plant graphic resources and download in the form of PNG, EPS, AI or PSD.',
  ];
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = listOfDesc[0];
    });    // print(_scrollController.offset.round());
    
    super.initState();
  }
  changedesc(){
    var value=_scrollController.offset.round();
    var desIndex=(value/150).round();
    print(value);
    setState(() {
      description=listOfDesc[desIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          decoration: BoxDecoration(
              // border: Border.all(width: 1),
              ),
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.0),
            children: <Widget>[
              buildStack(
                  "25",
                  "https://pluspng.com/img-png/plant-png-hd-plants-png-pic-png-image-900.png",
                  "OutDoor",
                  "Jungle"),
              SizedBox(width: 20),
              buildStack(
                  "25",
                  "https://www.freepngimg.com/thumb/plants/10-2-plants-png-clipart-thumb.png",
                  "OutDoor",
                  "Rose"),
              SizedBox(width: 20),
              buildStack(
                  "25",
                  "https://pluspng.com/img-png/plant-png-hd-plants-png-pic-png-image-900.png",
                  "OutDoor",
                  "Jungle"),
              SizedBox(width: 20),
              buildStack(
                  "25",
                  "https://www.freepngimg.com/thumb/plants/10-2-plants-png-clipart-thumb.png",
                  "OutDoor",
                  "Rose"),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 8.0, top: 5.0, bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Description',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              Text(
                '${description}',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Stack buildStack(
      String price, String planturl, String inOrOut, String plantName) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 325.0,
            width: 225.0,
            // // decoration: BoxDecoration(
            //   border:Border.all(width:1),
            // ),

            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[300],
              ),
              height: 250.0,
              width: 225.0,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'From',
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '\$' + price,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  Image(
                    image: NetworkImage(planturl),
                    height: 150,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            inOrOut,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            plantName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Montserrat",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      IconGenraterCustom(Icons.wb_sunny),
                      SizedBox(
                        width: 20,
                      ),
                      IconGenraterCustom(Icons.playlist_add),
                      SizedBox(
                        width: 20,
                      ),
                      IconGenraterCustom(Icons.place),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              o == 0.4 ? o = 1 : o = 0.4; //just for fun
                              // o=1;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.view_quilt,
                              color: Colors.white.withOpacity(o),
                              size: 20,
                            ),
                          ))
                    ],
                  )
                ],
              ),
              // child: Text('${MediaQuery.of(context).size.width}'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 90, top: 300),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            child: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class IconGenraterCustom extends StatelessWidget {
  // const IconGenraterCustom({
  //   Key key,
  // }) : super(key: key);
  IconData iconName;
  IconGenraterCustom(this.iconName);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Icon(
        // Icons.wb_sunny,
        iconName,
        color: Colors.white,
        size: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.white.withOpacity(0.5),
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
