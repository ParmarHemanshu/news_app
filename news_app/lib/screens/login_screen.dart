import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/cubit/HomeScreenCubit/source_list_view_cubit.dart';
import 'package:news_app/networking/api_get_request.dart';
import 'package:news_app/repositories/article_repository.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  "Welcome",
                  style: TextStyle(color: Colors.black54, fontSize: 24),
                ),
                Text(
                  "Back.",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 24),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  onPressed: () async {
                    await _googleSignIn.signIn();
                    _redirectUserToHomeScreen();
                  },
                  icon: Icon(
                    MdiIcons.google,
                    color: Colors.deepOrangeAccent,
                  ),
                  label: Text(
                    "Sign In with Google Account",
                    style: TextStyle(color: Colors.black38),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12))),
            ),
          ],
        ),
      ),
    );
  }

  void _redirectUserToHomeScreen() {
    ArticleRepository repository = ArticleRepository(ApiDataGetRequest(Dio()));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BlocProvider(
            create: (context) {
              return SourceListViewCubit(repository);
            },
            child: HomeScreen())));
  }
}
