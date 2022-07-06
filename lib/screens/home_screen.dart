import 'package:flutter/material.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/widgets/jobs_list.dart';
import 'package:provider/provider.dart';

import '../providers/jobs.dart';
import '../widgets/main_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return JobOperations();
                }));
              },
            )
          ],
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 0),
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Container(
            height: 40.0,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
          ),
          leadingWidth: 70.0,
        ),
        body: Consumer<Jobs>(
          builder: (_, cart, ch) => JobsList(),
        ));
  }
}
