import 'package:demo/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
const AppBarApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'ToDo App',
      home: Home(),
    );
  }
}