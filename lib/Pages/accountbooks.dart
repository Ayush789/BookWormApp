import 'package:bookshopapp/model/yourbooks.dart';
import 'package:bookshopapp/model/book.dart';
import 'package:flutter/material.dart';

class AccountBooksPage extends StatefulWidget {
  @override
  _AccountBooksPageState createState() => _AccountBooksPageState();
}

class _AccountBooksPageState extends State<AccountBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260000),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "You have read the following books....",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              itemBuilder: (context, i) => Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200.0,
                    width: 125.0,
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          mybooks[i].ImgUrl,
                          height: 200.0,
                          width: 125.0,
                          fit: BoxFit.cover,

                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            width: 180.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  mybooks[i].Title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: <Widget>[
                                    (mybooks[i].Stars >= 1)
                                        ? Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow,
                                          )
                                        : (mybooks[i].Stars == 0.5)
                                            ? Icon(
                                                Icons.star_half,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              )
                                            : Icon(
                                                Icons.star_border,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              ),
                                    (mybooks[i].Stars >= 2)
                                        ? Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow,
                                          )
                                        : (mybooks[i].Stars == 1.5)
                                            ? Icon(
                                                Icons.star_half,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              )
                                            : Icon(
                                                Icons.star_border,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              ),
                                    (mybooks[i].Stars >= 3)
                                        ? Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow,
                                          )
                                        : (mybooks[i].Stars == 2.5)
                                            ? Icon(
                                                Icons.star_half,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              )
                                            : Icon(
                                                Icons.star_border,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              ),
                                    (mybooks[i].Stars >= 4)
                                        ? Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow,
                                          )
                                        : (mybooks[i].Stars == 3.5)
                                            ? Icon(
                                                Icons.star_half,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              )
                                            : Icon(
                                                Icons.star_border,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              ),
                                    (mybooks[i].Stars >= 5)
                                        ? Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow,
                                          )
                                        : (mybooks[i].Stars == 4.5)
                                            ? Icon(
                                                Icons.star_half,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              )
                                            : Icon(
                                                Icons.star_border,
                                                size: 15.0,
                                                color: Colors.yellow,
                                              ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 12.0),
                                    children: [
                                      TextSpan(
                                        text: mybooks[i]
                                            .Description
                                            .substring(0, 175),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                          text: "...more",
                                          style: TextStyle(color: Colors.blue))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: mybooks.length,
            ),
          ],
        ),
      ),
    );
  }
}
