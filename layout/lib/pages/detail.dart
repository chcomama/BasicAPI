// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4; //ข้อมูลที่จะส่งเข้ามา
  DetailPage(this.v1, this.v2, this.v3,
      this.v4); //this เรียกตัวเองเข้ามาที่ DetailPage

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;
  @override
  void initState() {
    // TODO: implement initState
    //เปิดมาครั้งแรก
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: ListView(children: [
           SizedBox(
            height: 10,
          ),
          Text(
            _v1,
            style: TextStyle(fontSize: 30),
          ),  SizedBox(
            height: 10,
          ),
          Text(_v2,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal.shade900,
                  fontWeight: FontWeight.bold)),  SizedBox(
            height: 10,
          ),
                  
          Image.network(_v3),
          SizedBox(
            height: 15,
          ),
          Text(_v4, style: TextStyle(fontSize: 15))
        ]),
      ),
    );
  }
}
