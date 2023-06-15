import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailPage extends StatefulWidget {
  final String url;
  DetailPage({required String this.url});

  @override
  _DetailPageState createState() => _DetailPageState();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      );
     }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child:Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 130),
                      child: Image.network(widget.url),
                    ),
                  ],
                ),
                ),
              ),
            ],
          ),
        ],
        
      ),
      
      );
  }
}
