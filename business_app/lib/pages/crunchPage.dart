import 'package:business_app/model/News.dart';
import 'package:business_app/services/crunch.dart';
import 'package:flutter/material.dart';

class Crunch extends StatefulWidget {
  const Crunch({Key key}) : super(key: key);

  @override
  _CrunchState createState() => _CrunchState();
}

class _CrunchState extends State<Crunch> {
  Future<News> crunches;
  @override
  void initState() {
    crunches = CrunchService().crunches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<News>(
            future: crunches,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var articles = snapshot.data.articles[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Image.network(
                                articles.urlToImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(articles.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(articles.description,
                                style: TextStyle(color: Colors.grey[800])),
                          ),
                        ],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
