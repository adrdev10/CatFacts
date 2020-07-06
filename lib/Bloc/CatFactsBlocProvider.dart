//Dependency injection using the InheritedWidget class

import 'package:flutter/cupertino.dart';

import 'CatFactsBlocState.dart';

class CatFactsBlocProvider extends InheritedWidget {

  final CatFactsBloc bloc;
  final Widget child;

  CatFactsBlocProvider({this.bloc, this.child}) : super(child: child);

  static CatFactsBlocProvider of(BuildContext content) => content.dependOnInheritedWidgetOfExactType(aspect: CatFactsBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

