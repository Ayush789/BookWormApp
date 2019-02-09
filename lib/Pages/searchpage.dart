import 'package:bookshopapp/Pages/bookpage.dart';
import 'package:bookshopapp/model/book.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260000),
      body: ListView(
        children: <Widget>[
          Text(
            "Select Books....",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 150.0,
            child: ListView.builder(
              itemBuilder: (context, i) => InkWell(
                onTap: () {

                },
                child: Container(
                  width: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Image.network(
                              booklist[i].ImgUrl,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: booklist.length,
            ),
          ),
        ],
      ),
    );
  }
}
