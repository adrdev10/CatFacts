import 'package:catfacts/Bloc/CatFactsBlocProvider.dart';
import 'package:catfacts/Bloc/CatFactsBlocState.dart';
import 'package:catfacts/Widgets/CatFacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CanvasColorWidget extends StatefulWidget {
  CanvasColorWidget({Key key}) : super(key: key);
  final bloc = CatFactsBloc();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CanvasColorWidgetState();
  }
}

class CanvasColorWidgetState extends State<CanvasColorWidget> {
  List<String> list = [
    "#FA5835",
    "#51BFE5",
    "#B04EF0",
    "#F0F04E",
    "#F09A4E",
    "#22E8AC"
  ];
  Color colorSelected;
  int randomFact = Random().nextInt(246);

  String getRandomColor() {
    int randomNumber = Random().nextInt(list.length);
    return list[randomNumber];
  }

  /// Construct a color from a hex code string, of the format #RRGGBB.
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1), radix: 16) + 0xFF000000);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorSelected = hexToColor(getRandomColor());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xff5439c4),
        ),
        child: Center(
            child: GestureDetector(
                // onTap: () => {
                //       setState(() {
                //         colorSelected = hexToColor(getRandomColor());
                //         randomFact = Random().nextInt(246);
                //         print(colorSelected);
                //       })
                //     },
                child: CatFactsBlocProvider(
          bloc: widget.bloc,
          child: CatFacts(randomFact: randomFact),
        ))));
  }
}
