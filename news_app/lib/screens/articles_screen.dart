import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/ArticleScreenCubit/article_list_view_cubit.dart';
import 'package:news_app/widgets/article_card.dart';

class ArticleScreen extends StatefulWidget {
  String sourceName;

  ArticleScreen({required this.sourceName});

  @override
  _ArticleScreenState createState() => _ArticleScreenState(sourceName);
}

class _ArticleScreenState extends State<ArticleScreen> {
  String sourceName;

  _ArticleScreenState(this.sourceName);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Icon(
                  Icons.outbox,
                  color: Colors.grey,
                ))),
        title: sourceName == ""
            ? Text("Braking News")
            : Text(
                sourceName,
                style: TextStyle(color: Colors.grey),
              ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<ArticleListViewCubit, ArticleListViewState>(
          builder: (context, state) {
            if (state is ArticleListViewInitial) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 6,
              ));
            } else if (state is ArticleListViewLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.redAccent,
                strokeWidth: 6,
              ));
            } else if (state is ArticleListViewLoaded) {
              final articles = state.articles;
              return buildArticleListView(context, articles, sourceName);
            }

            return Center(child: Text("Coudn't connect to server. !!"));
          },
        ),
      ),
    ));
  }
}
