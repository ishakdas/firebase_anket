import 'package:anket_firebase/details.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: "Flutter Türkiye",
      debugShowCheckedModeBanner: false, //Ne işe yaradığını gör
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async{
    final response=await http.get("https://www.flutterforum.org/mobil/getdata.php");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme Alanı"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Eroor");
          }
          if (ss.hasData) {
            return Items(list: ss.data);
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({this.list});
  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(list[i]['name']),
          subtitle: Text(list[i]['id']),
          onTap: ()=>Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context)=>Details(list:list,index:i))
          ),
        );
      },
    );
  }
}
