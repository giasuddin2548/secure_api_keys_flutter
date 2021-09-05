import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<void> main() async{

  await dotenv.load(fileName: "assets/.env"); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  String foo = dotenv.get('API_KEY');
  String foo1 = dotenv.get('SECRET_KEY');
  String devName = dotenv.get('DEVELOPER_NAME');


  @override
  void initState() {
    print('Native:$foo');
    print('Native:$foo1');


    Codec<String, String> stringToBase64 = utf8.fuse(base64); // dXNlcm5hbWU6cGFzc3dvcmQ=
    String decoded = stringToBase64.decode(devName);



    print('Native:$decoded');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
