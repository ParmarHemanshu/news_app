import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/models/article_model.dart';

Widget buildArticleListView(
    BuildContext context, List<Articles> articles, String sourceName) {
  return ListView.builder(
    itemCount: articles.length, //sources.length
    itemBuilder: (context, index) {
      var articleDesc = articles[index].description.toString();
      var articleSourceName = articles[index].source.name.toString();
      var title = articles[index].title.toString();
      var image = articles[index].urlToImage.toString();
      if (articleSourceName == sourceName) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(4),
          child: SizedBox(
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ExpandableText(
                            articleDesc,
                            expandText: "Show More",
                            collapseText: "Show Less",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                child: Icon(
                              MdiIcons.bookmarkOutline,
                              color: Colors.blue,
                            )))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container(
          height: 0,
        );
      }
    },
  );
}
