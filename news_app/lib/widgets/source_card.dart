import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/cubit/ArticleScreenCubit/article_list_view_cubit.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/networking/api_get_request.dart';
import 'package:news_app/repositories/article_repository.dart';
import 'package:news_app/screens/articles_screen.dart';
import 'package:simple_url_preview/simple_url_preview.dart';

Widget buildSourceListView(BuildContext context, List<Sources> sources) {
  return ListView.builder(
    itemCount: sources.length, //sources.length
    itemBuilder: (context, index) {
      var sourceName = sources[index].name.toString();
      var articleDesc = sources[index].description.toString();
      var category = sources[index].category.toString();
      var country = sources[index].country.toString();
      var url = sources[index].url.toString();

      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                      create: (context) {
                        ArticleRepository repository = ArticleRepository(
                            ApiDataGetRequest(Dio(), sourceName: sourceName));
                        return ArticleListViewCubit(repository);
                      },
                      child: ArticleScreen(sourceName: sourceName,))));
        },
        child: Container(
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
                        SimpleUrlPreview(
                          url: url,
                          bgColor: Colors.white,
                          descriptionStyle: TextStyle(color: Colors.grey),
                          titleStyle: TextStyle(color: Colors.blue),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            sourceName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            articleDesc,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                "Category : " + category,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, bottom: 4),
                              child: Text(
                                "Country : " + country,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    child: Icon(
                                  MdiIcons.openInNew,
                                  color: Colors.blue,
                                ))),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    child: Icon(
                                  MdiIcons.bookmarkOutline,
                                  color: Colors.grey,
                                )))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
