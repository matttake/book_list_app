import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/BookListRiverpodVer/book_list/riv_book_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../new/book_list/book_list_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
    Firebase.initializeApp(); // new
    return MaterialApp(
      title: "Flutter App",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("List of Test Pages"),
          ),
          body: Home()),
    );
  }
}

// 画面遷移をする部分のコード
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextBtnNextPage(
                btn_text: "To: BookListPage", page_name: BookListPageNew()),
            TextBtnNextPage(
                btn_text: "To: BookListPage Riverpod Ver",
                page_name: RivBookListPage()),
          ],
        ),
      ),
    );
  }
}

class TextBtnNextPage extends StatelessWidget {
  TextBtnNextPage({required this.btn_text, this.page_name});

  final String btn_text;
  var page_name;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(btn_text),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page_name),
        );
      },
    );
  }
}
