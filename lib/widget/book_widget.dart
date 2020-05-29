import 'package:flutter/material.dart';
import 'package:flutterbook/model/book_model.dart';
import 'package:flutterbook/pages/details_page.dart';

class BookWidget extends StatelessWidget {
  BookModel model;

  BookWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage(model)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  model.image,
                  width: 70,
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      model.author,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text("\$${model.price}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
