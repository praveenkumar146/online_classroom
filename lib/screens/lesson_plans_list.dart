import 'dart:convert';
import 'dart:developer';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import 'lesson_plan.dart';

class LessonPlanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let Learning gets easier..")),
      body: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          log("called builded");
          log("$snapshot");
          if (snapshot.hasData) {
            return _buildLessonPlans(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

  initState() {
    fetchPost();
  }

  Widget _buildLessonPlans(context, lessonPlanList) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < lessonPlanList.length; i++) {
      list.add(new Card(
        child: Row(
          children: <Widget>[
            Text(lessonPlanList[i]["name"]),
          ],
        ),
      ));
    }
    return new Column(children: list);
  }

  Future fetchPost() async {
    final response = await http
        .get('https://api.jsonbin.io/b/5d1c879c2c39867519debfb1/latest');
    log("Fetch post");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      log(response.body);
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
