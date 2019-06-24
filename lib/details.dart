import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details extends StatefulWidget {
  List list;
  int index;
  Details({this.list, this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${widget.list[widget.index]['name']}")),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                widget.list[widget.index]['name'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                widget.list[widget.index]['description'],
              ),
             
            ],
          ),
        ));
  }
}
