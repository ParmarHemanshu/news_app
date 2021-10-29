import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/HomeScreenCubit/source_list_view_cubit.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/widgets/source_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Icon(
                        Icons.outbox,
                        color: Colors.grey,
                      ))),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Breaking",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "News",
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ],
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
              child: BlocBuilder<SourceListViewCubit, ListViewState>(
                builder: (context, state) {
                  if (state is ListViewInitial) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 6,
                    ));
                  } else if (state is ListViewLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.redAccent,
                      strokeWidth: 6,
                    ));
                  } else if (state is ListViewLoaded) {
                    final sources = state.sources;
                    return buildSourceListView(context, sources);
                  }

                  return Center(child: Text("Coudn't connect to server. !!"));
                },
              ),
            )));
  }
}
