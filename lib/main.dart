import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pro_quotes/data/core/api_client.dart';
import 'package:pro_quotes/data/datasources/quotes_remote_datasource.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

void main() async {
  RandomQuoteRemoteDatasource randomDataSource =
      RandomQuoteRemoteDatasourceImpl(ApiClient(
    Client(),
  ));
  final quote = await randomDataSource.getRandomQuote();
  runApp(MyApp(
    quote: quote,
  ));
}

class MyApp extends StatelessWidget {
  final RandomQuoteModel quote;
  const MyApp({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text(quote.quote ?? "No quote"))],
        ),
      ),
    );
  }
}
