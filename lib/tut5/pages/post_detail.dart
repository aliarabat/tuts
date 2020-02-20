import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuts/tut5/data/post_api_service.dart';
import 'package:tuts/tut5/model/built_post.dart';

class PostDetail extends StatelessWidget {
  final int id;
  const PostDetail({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post $id'),
      ),
      body: FutureBuilder<Response<BuiltPost>>(
        future: Provider.of<PostApiService>(context).getPost(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final post = snapshot.data.body;
            return ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                post.title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                post.body,
                textScaleFactor: 1.2,
                textAlign: TextAlign.justify,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
