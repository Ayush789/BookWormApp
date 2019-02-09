import 'package:bookshopapp/model/book.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  Book book;

  BookPage({this.book});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Color mainCol = Color(0xFF260000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainCol,
      body: Stack(
        children: <Widget>[
          Image.network(
            widget.book.ImgUrl,
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 300.0,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: <Color>[
                        mainCol.withOpacity(0.0),
                        mainCol.withOpacity(1.0),
                      ],
                      stops: [0.0, 0.9],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    ),
                  ),
                ),
                Container(
                  color: mainCol,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.book.Title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.book.Author,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            (widget.book.Availible)
                                ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Availible",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  )
                                : Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Unavailible",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            (widget.book.Stars >= 1)
                                ? Icon(
                                    Icons.star,
                                    size: 25.0,
                                    color: Colors.yellow,
                                  )
                                : (widget.book.Stars == 0.5)
                                    ? Icon(
                                        Icons.star_half,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      ),
                            (widget.book.Stars >= 2)
                                ? Icon(
                                    Icons.star,
                                    size: 25.0,
                                    color: Colors.yellow,
                                  )
                                : (widget.book.Stars == 1.5)
                                    ? Icon(
                                        Icons.star_half,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      ),
                            (widget.book.Stars >= 3)
                                ? Icon(
                                    Icons.star,
                                    size: 25.0,
                                    color: Colors.yellow,
                                  )
                                : (widget.book.Stars == 2.5)
                                    ? Icon(
                                        Icons.star_half,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      ),
                            (widget.book.Stars >= 4)
                                ? Icon(
                                    Icons.star,
                                    size: 25.0,
                                    color: Colors.yellow,
                                  )
                                : (widget.book.Stars == 3.5)
                                    ? Icon(
                                        Icons.star_half,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      ),
                            (widget.book.Stars >= 5)
                                ? Icon(
                                    Icons.star,
                                    size: 25.0,
                                    color: Colors.yellow,
                                  )
                                : (widget.book.Stars == 4.5)
                                    ? Icon(
                                        Icons.star_half,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 25.0,
                                        color: Colors.yellow,
                                      ),
                          ],
                        ),
                        Text(
                          widget.book.Description,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\nSimilar Books....",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: (booklist[i]
                                                              .Availible)
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
