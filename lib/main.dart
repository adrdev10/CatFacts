import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "Widgets/CanvasColorWidget.dart";

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff5439c4), //or set color with: Color(0xFF0000FF)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.black26,
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xff5439c4)),
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black12, offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    )
                  ]),
                  clipBehavior: Clip.hardEdge,
                  child: Text(
                    'Cat Facts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ToggleLanguage(),
              SizedBox(
                height: 40,
              ),
              CanvasColorWidget(),
            ],
          ),
        )),
      ),
    );
  }
}

class ToggleLanguage extends StatefulWidget {
  const ToggleLanguage({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToggleLanguageState();
  }
}

class ToggleLanguageState extends State<ToggleLanguage> {
  List<bool> toggle = [true, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (index) {},
      children: [
        Container(
          child: IconButton(
            onPressed: () {
              setState(() {
                toggle = toggle.map((e) => !e).toList();
              });
            },
            icon: Icon(Icons.language),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {
              setState(() {
                toggle = toggle.map((e) => !e).toList();
              });
            },
            icon: Icon(Icons.language),
          ),
        )
      ],
      isSelected: toggle,
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width * 2, size.height + 38);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
