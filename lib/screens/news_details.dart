import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newswatch/model/article_model.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key, required this.article});

  final Article article;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          0.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Article article = widget.article;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: <Widget>[
          Icon(
            CupertinoIcons.bookmark,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            CupertinoIcons.share,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              article.urlToImage != ""
                  ? Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(article.urlToImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    )
                  : Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1510853675132-58241c941e4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2305&q=80"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
              Padding(
                padding: new EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.bubble_left,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.heart,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      article.description,
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        //show/hide animation
        duration: Duration(milliseconds: 500),
        opacity: showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
                //go to top of scroll
                0, //scroll offset to go
                duration: Duration(milliseconds: 500), //duration of scroll
                curve: Curves.fastOutSlowIn //scroll type
                );
          },
          child: Icon(Icons.arrow_upward),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
// Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           CupertinoIcons.bubble_left,
//                           color: Colors.blue,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Icon(
//                           CupertinoIcons.heart,
//                           color: Colors.blue,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Icon(
//                           Icons.share,
//                           color: Colors.blue,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
