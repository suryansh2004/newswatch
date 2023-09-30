import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newswatch/model/article_model.dart';
import 'package:newswatch/screens/custom_listile.dart';

import 'package:newswatch/services/api_services.dart';

class NewsCardWidget extends StatefulWidget {
  const NewsCardWidget({super.key});

  @override
  State<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) =>
                    customListTile(articles![index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
