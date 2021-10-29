import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/cubit/HomeScreenCubit/source_list_view_cubit.dart';
import 'package:news_app/networking/api_get_request.dart';
import 'package:news_app/repositories/article_repository.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      var user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        //navigate to login screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        //navigate to home screen
        ArticleRepository repository =
            ArticleRepository(ApiDataGetRequest(Dio()));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) {
                  return SourceListViewCubit(repository);
                },
                child: HomeScreen())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.newspaper,
            color: Colors.blueAccent,
            size: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Breaking",
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.blueAccent, fontSize: 24),
              )
            ],
          ),
        ],
      ),
    );
  }
}
