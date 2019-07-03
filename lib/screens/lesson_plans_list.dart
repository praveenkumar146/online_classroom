import "package:flutter/material.dart";
// import "package:http/http.dart";

import 'lesson_plan.dart';

class LessonPlanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let Learning gets easier..")),
      body: _buildLessonPlans(context),
    );
  }

  Widget _buildLessonPlans(context) => SizedBox(
    // height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Lesson plan 1',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('subject name'),
            leading: Icon(
              Icons.track_changes,
              color: Colors.blue[500],
            ),
            onTap: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonPlan()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Lesson plan 1',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('subject name'),
            leading: Icon(
              Icons.track_changes,
              color: Colors.blue[500],
            ),
          ),
          Divider(),

        ],
      ),
    ),
  );

  Future fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}