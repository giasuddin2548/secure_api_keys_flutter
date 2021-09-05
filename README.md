# How to secure api keys and secret keys in flutter

## Protect your app from reverse engineering

#### Used Library: 
 [Flutter dotenv](https://pub.dev/packages/flutter_dotenv)
 
 ### .ENV file from assets folder
 STEP-1: Create a file on assets folder
 ```
API_KEY='I AM API KEY'
SECRET_KEY='I AM SECRET KEY'
DEVELOPER_NAME='R2lhcyBVZGRpbiBTYW1pcg=='
 ```
 
 ### Source code
```dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<void> main() async{

 //STEP-2: register your file here
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





   //STEP-3: Read your data here 
   
  String foo = dotenv.get('API_KEY');
  String foo1 = dotenv.get('SECRET_KEY');
  String devName = dotenv.get('DEVELOPER_NAME');


  @override
  void initState() {
    print('Native:$foo');
    print('Native:$foo1');


     //STEP-4: optional 
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


```

