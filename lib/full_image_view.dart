import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YellowBird extends StatefulWidget {
  const YellowBird({ super.key });

  @override State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  var urlData;
  void getApiData() async {

    var url = Uri.parse(
        'https://api.unsplash.com/search/photos?page=1&query=pants&client_id=y8Dy2bVCPdaZtXg_HZEO9TPSJMGQ1Bze9SFCiGRWLS4');
    final res = await http.get(url);
    setState(() {
      urlData = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: urlData==null?CircularProgressIndicator():GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 6,crossAxisCount: 2, crossAxisSpacing: 6), itemBuilder: (context,i){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageView(
              url: urlData[i]['urls']['full'],
            )));
          },
        );
      }),),
    );
  }
}

class FullImageView extends StatelessWidget {
  var url;
  FullImageView({this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'full',
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          maxScale: 5,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover
                )
            ),
          ),
        ));
  }
}

