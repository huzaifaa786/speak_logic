import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/books_model.dart';
import 'package:books/values/string.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class BookController extends GetxController {
  static BookController instance = Get.find();

 List<Book> books = [];
  List<Book> Searchbooks = [];
  getbook() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/books';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

      List<Book> book = <Book>[];
      for (var van in response['books']) {
        book.add(Book(van));
      }
      books = book;
      Searchbooks = books;
      LoadingHelper.dismiss();
      print(books);
      update();

  }
   void searchBooks(String query) {
    if (query == '') {
      Searchbooks = books;
    } else {
      Searchbooks = books
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}
