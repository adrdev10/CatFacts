

import 'package:catfacts/Bloc/CatFactsBlocProvider.dart';
import 'package:catfacts/Bloc/CatFactsBlocState.dart';
import 'package:catfacts/model/CatFacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatFacts extends StatefulWidget{
  int randomFact;

  CatFacts(this.randomFact);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CatFactsState();
  }
}


class CatFactsState extends State<CatFacts> {
  bool firstTimeLoad = true;

  @override
  Widget build(BuildContext context) {
    CatFactsBloc bloc = CatFactsBlocProvider.of(context).bloc;
    if (firstTimeLoad) {
      bloc.fetchCatFacts('facts');
      firstTimeLoad = false;
    }
    
    return StreamBuilder<CatFactsBlocState>(
      stream: bloc.catFactsStream,
      initialData: bloc.getCatFactsState(),
      builder: (BuildContext context, AsyncSnapshot<CatFactsBlocState> snapshot) {
        if (snapshot.data.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Text(
            '${snapshot.data.catFacts.facts[widget.randomFact]}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }, 
    );
  }
 
}


