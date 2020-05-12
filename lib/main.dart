import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_infinite_list/bloc/post_bloc.dart';
import 'package:flutter_bloc_infinite_list/delegate/simple_bloc_delegate.dart';
import 'package:flutter_bloc_infinite_list/page/home_page.dart';
import 'package:http/http.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => PostBloc(
            client: Client(),
          )..add(Fetch()),
          child: HomePage(),
        ),
      ),
    );
  }
}
