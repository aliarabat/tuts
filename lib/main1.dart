import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:tuts/tut5/data/post_api_service.dart';
import 'package:tuts/tut5/model/built_post.dart';
import 'package:tuts/tut5/pages/post_detail.dart';
import 'package:built_collection/built_collection.dart';

void main() {
  _setupLogging();
  runApp(Main0());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord
      .listen((rec) => print('${rec.level.name} ${rec.time} ${rec.message}'));
}

class Main0 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red[600]),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Http app'),
          ),
          floatingActionButton: _buildFloatingButton(context),
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<Response<BuiltList<BuiltPost>>>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            textScaleFactor: 1.6,
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return _builPosts(snapshot.data.body);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _builPosts(BuiltList<BuiltPost> posts) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PostDetail(id: posts[index].id),
                ),
              );
            },
            title: Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            subtitle: Text(
              posts[index].body,
              textScaleFactor: 1.2,
              textAlign: TextAlign.justify,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final newPost = BuiltPost(
          (b) => b
            ..title = "Title goes here"
            ..body = "Body goes here",
        );
        final response =
            await Provider.of<PostApiService>(context).postPost(newPost);
        print(response.body);
      },
      child: Icon(
        Icons.add,
      ),
      backgroundColor: Theme.of(context).appBarTheme.color,
    );
  }
}
