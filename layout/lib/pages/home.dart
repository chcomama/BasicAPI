// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Khaowongkot Farm"),
      ),
      body: Padding(
        // Wrap with padding //ไฟเหลือง
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          builder: (context, snapshot) {
            var data = json
                .decode(snapshot.data.toString()); //[{title},{subtitle},{url}]
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'],
                    data[index]['image_url'],data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          //เหมือนกับ
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;

    return Container(
      padding: EdgeInsets.all(20), //ความห่างจากขอบจอ
      margin: EdgeInsets.only(top: 20), //ความห่างระหว่าง MyBox
      //  color: Colors.lightGreen[100],
      height: 150,
      decoration: BoxDecoration(
          //  color: Colors.lightGreen[100],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover, //ให้รูปอยู่ในกรอบ
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken), //ทำให้ภาพจาง
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, // เรียกฟังก์ชั่น title

            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              print("Next Page >>>> ");
              //กดเพื่อลิ้งค์ไปหน้าอื่น
              Navigator.push(
                context,
                MaterialPageRoute(
                  //context = ให้รู้ว่าจะกลับไปหน้าไหน
                  builder: (context) => DetailPage(v1,v2,v3,v4),
                ),
              );
            },
            child: Text(
              "Read More...",
              style: TextStyle(color: Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}
