import 'dart:convert';

import 'package:bookshopapp/Pages/bookpage.dart';
import 'package:bookshopapp/Pages/results.dart';
import 'package:bookshopapp/model/book.dart';
import 'package:bookshopapp/model/yourbooks.dart';
import 'package:flutter/material.dart';
import 'package:bookshopapp/model/data.dart';
import 'package:http/http.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double length = 5000.0;
  List<bool> selectedList = List<bool>.filled(mybooks.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String url = "https://ayushiitr.serveo.net/getRecommendation?mode=1";

          for (int i = 0; i < selectedList.length; i++) {
            if (selectedList[i]) {
              url += "&id=${mybooks[i].Id}";
            }
          }

          var resp = await get(url);
          print("Response ${resp.body}");

          var jsondata = json.decode(resp.body);

          print(jsondata["ids"]);

          List<Book> results = [];

          if (jsondata["ids"].length != 0)
            for (int i = 0; i < jsondata["ids"].length; i++) {
              for (int j = 0; j < booklist.length; j++) {
                if (booklist[j].Id == jsondata["ids"][i].toString()) {
                  print("Got ${booklist[j].Id}");
                  results.add(booklist[j]);
                  break;
                }
              }
            }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        resultList: results,
                      )));
        },
        label: Text("Search\nSimilar"),
        heroTag: null,
        icon: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Color(0xFF260000),
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Which of the following would you like similar books....",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: booksToCols(mybooks),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment(-1.0, 1.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.redAccent,
                onPressed: () async {
                  String url = "https://ayushiitr.serveo.net/getRecommendation?mode=2";

                  for (int i = 0; i < selectedList.length; i++) {
                    if (selectedList[i]) {
                      url += "&id=${mybooks[i].Id}";
                    }
                  }

                  var resp = await get(url);
                  print("Response ${resp.body}");

                  var jsondata = json.decode(resp.body);

                  print(jsondata["ids"]);

                  List<Book> results = [];

                  if (jsondata["ids"].length != 0)
                    for (int i = 0; i < jsondata["ids"].length; i++) {
                      for (int j = 0; j < booklist.length; j++) {
                        if (booklist[j].Id == jsondata["ids"][i].toString()) {
                          print("Got ${booklist[j].Id}");
                          results.add(booklist[j]);
                          break;
                        }
                      }
                    }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            resultList: results,
                          )));
                },
                icon: Icon(Icons.search),
                label: Text("Search\nDifferent"),
                heroTag: false,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> booksToCols(List<Book> books) {
    List<Widget> ans = [];

    int numRows = (books.length / 2).ceil();

    for (int i = 0; i < numRows; i++) {
      List<Widget> curlist = [];
      for (int j = 0; j < 2; j++) {
        if (i * 2 + j < mybooks.length)
          curlist.add(
            Container(
              width: 150,
              height: 270,
              child: InkWell(
                onTap: () {
                  print(selectedList);
                  if (selectedList[2 * i + j])
                    selectedList[2 * i + j] = false;
                  else
                    selectedList[2 * i + j] = true;
                  setState(() {});
                },
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      mybooks[i * 2 + j].ImgUrl,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        (selectedList[2 * i + j])
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
      }

      ans.add(Row(
        children: curlist,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ));
    }
    return ans;
  }
}
