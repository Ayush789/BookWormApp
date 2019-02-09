import 'package:bookshopapp/Pages/bookpage.dart';
import 'package:bookshopapp/Pages/searchpage.dart';
import 'package:bookshopapp/model/book.dart';
import 'package:bookshopapp/model/data.dart';
import 'package:bookshopapp/Pages/accountbooks.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF260000),
      ),
      debugShowCheckedModeBanner: false,
      home: BookstoreFrontPage(),
    );
  }
}

class BookstoreFrontPage extends StatefulWidget {
  @override
  _BookstoreFrontPageState createState() => _BookstoreFrontPageState();
}

class _BookstoreFrontPageState extends State<BookstoreFrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Ruchi Soni",
                style: TextStyle(fontSize: 22.0),
              ),
              accountEmail: Text("ruchisoni101@gmail.com"),
              currentAccountPicture: Image.asset(
                "account.png",
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountBooksPage()));
              },
              leading: Icon(Icons.book),
              title: Text("Your Books"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        child: Icon(
          Icons.search,
          size: 35.0,
        ),
      ),
      backgroundColor: Color(0xFF260000),
      body: Stack(
        children: <Widget>[
          Image.asset('bg.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(50.0),
                ),
                Text(
                  "New Release....",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 150.0,
                  child: ListView.builder(
                    itemBuilder: (context, i) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookPage(
                                      book: booklist[i],
                                    ),
                              ),
                            );
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: (booklist[i].Availible)
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: Colors.green,
                                                    )
                                                  : Icon(Icons.cancel),
                                            ),
                                          ),
                                        ],
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
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0)),
                      height: 50.0,
                      width: 300.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Search Book",
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(0.0),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (context, i) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookPage(
                                      book: booklist[i],
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            height: 200.0,
                            width: 125.0,
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  booklist[i].ImgUrl,
                                  height: 200.0,
                                  width: 125.0,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Container(
                                    width: 180.0,
                                    padding: EdgeInsets.all(5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          booklist[i].Title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            (booklist[i].Stars >= 1)
                                                ? Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.yellow,
                                                  )
                                                : (booklist[i].Stars == 0.5)
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
                                            (booklist[i].Stars >= 2)
                                                ? Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.yellow,
                                                  )
                                                : (booklist[i].Stars == 1.5)
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
                                            (booklist[i].Stars >= 3)
                                                ? Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.yellow,
                                                  )
                                                : (booklist[i].Stars == 2.5)
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
                                            (booklist[i].Stars >= 4)
                                                ? Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.yellow,
                                                  )
                                                : (booklist[i].Stars == 3.5)
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
                                            (booklist[i].Stars >= 5)
                                                ? Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.yellow,
                                                  )
                                                : (booklist[i].Stars == 4.5)
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
                                                text: (booklist[i]
                                                            .Description
                                                            .length >
                                                        175)
                                                    ? booklist[i]
                                                        .Description
                                                        .substring(0, 175)
                                                    : booklist[i].Description,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                  text: "...more",
                                                  style: TextStyle(
                                                      color: Colors.blue))
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
                        ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: booklist.length,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
