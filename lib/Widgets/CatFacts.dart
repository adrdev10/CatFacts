import 'package:catfacts/Bloc/CatFactsBlocProvider.dart';
import 'package:catfacts/Bloc/CatFactsBlocState.dart';
import 'package:catfacts/model/CatFacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CatFacts extends StatefulWidget {
  int randomFact;

  CatFacts({Key key, @required this.randomFact}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CatFactsState();
  }
}

class CatFactsState extends State<CatFacts> {
  bool firstTimeLoad = true;
  CatFactsBloc bloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bloc = CatFactsBlocProvider.of(context).bloc;
    bloc.fetchCatFacts('facts');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CatFactsBlocState>(
      stream: bloc.catFactsStream,
      initialData: bloc.getCatFactsState(),
      builder:
          (BuildContext context, AsyncSnapshot<CatFactsBlocState> snapshot) {
        if (snapshot.data.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Swiper(
            itemCount: snapshot.data.catFacts.facts.length,
            layout: SwiperLayout.STACK,
            itemWidth: MediaQuery.of(context).size.width * 0.7,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.black54,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${snapshot.data.catFacts.facts[index]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
