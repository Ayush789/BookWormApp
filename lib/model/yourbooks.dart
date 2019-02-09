import 'package:bookshopapp/model/book.dart';
import 'package:bookshopapp/model/data.dart';

List<Book> mybooks=List<Book>.generate(booklist.length~/5, (index)=>booklist[index*5]);