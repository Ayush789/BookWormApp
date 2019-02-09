import 'package:bookshopapp/Pages/bookpage.dart';
import 'package:bookshopapp/Pages/results.dart';
import 'package:bookshopapp/model/book.dart';
import 'package:flutter/material.dart';
import 'package:bookshopapp/model/data.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double length = 5000.0;
  List<bool> selectedList = List<bool>.filled(booklist.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          String url = "http://goole.com?";

          for (int i = 0; i < selectedList.length; i++) {
            if (selectedList[i]) {
              url += "&id=${booklist[i].Id}";
            }
          }

          print(url);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        resultList: booklist,
                      )));
        },
        label: Text("Search"),
        icon: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xFF260000),
      body: ListView(
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
            children: booksToCols(booklist),
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
        if (i * 2 + j < booklist.length)
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
                      booklist[i * 2 + j].ImgUrl,
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
