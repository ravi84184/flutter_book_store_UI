import 'package:flutter/material.dart';
import 'package:flutterbook/model/book_model.dart';

import '../common.dart';
import 'new_tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hi, Ravi",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Discover Latest Book",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            // Search Box
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search book..",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2.5),
                insets: EdgeInsets.fromLTRB(0.0, 00.0, 30.0, 0.0),
              ),
              unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
              unselectedLabelColor: Colors.grey[500],
              labelColor: Colors.black,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 0, right: 20),
              tabs: [
                _tabWidget("New"),
                _tabWidget("Trending"),
                _tabWidget("Best Sellar"),
              ],
            ),
            SizedBox(height: 5,),
            Flexible(
                child: Container(
              child: TabBarView(controller: _tabController, children: [
                NewTabWidget(),
                Container(),
                Container(),
              ]),
            ))
          ],
        ),
      ),
    );
  }

  Widget _tabWidget(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(title),
    );
  }
}
