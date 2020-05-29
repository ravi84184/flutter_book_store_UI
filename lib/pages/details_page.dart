import 'package:flutter/material.dart';
import 'package:flutterbook/common.dart';
import 'package:flutterbook/model/book_model.dart';

class DetailsPage extends StatefulWidget {
  BookModel model;

  DetailsPage(this.model);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header
            Container(
              color: color1,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.model.image,
                        height: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.model.name,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.model.author,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: <Widget>[
                        Text(
                          "\$",
                          style: TextStyle(color: btnColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Text(
                            widget.model.price,
                            style: TextStyle(color: btnColor, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Tab
                    TabBar(
                      controller: _tabController,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 2.5),
                        insets: EdgeInsets.fromLTRB(0.0, 00.0, 70.0, 0.0),
                      ),
                      unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      isScrollable: false,
                      labelPadding: EdgeInsets.only(left: 0, right: 20),
                      tabs: [
                        _tabWidget("Description"),
                        _tabWidget("Reviews(20)"),
                        _tabWidget("Similliar"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"),
                          ),
                          Container(
                            child: Text("Reviews"),
                          ),
                          Container(
                            child: Text("Similliar"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabWidget(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 5),
      child: Text(title),
    );
  }
}
