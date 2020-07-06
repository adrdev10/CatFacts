import 'dart:async';

import 'package:catfacts/model/CatFacts.dart';
import 'package:catfacts/model/CatFactsClient.dart';

class CatFactsBlocState {
  bool loading;
  CatFacts catFacts;

  CatFactsBlocState(this.catFacts, this.loading);

  CatFactsBlocState.empty() {
    loading = false;
    catFacts = null;
  }
}
  

class CatFactsBloc {
  final _apiClient = CatFactsClient();

  CatFactsBlocState catFactsState;
  StreamSubscription<CatFacts> fetchCatFactsSubscription;

  final catFactsController = StreamController<CatFactsBlocState>.broadcast();
  Stream<CatFactsBlocState> get catFactsStream => catFactsController.stream;

  CatFactsBloc() {
    catFactsState = CatFactsBlocState.empty();
  }

  CatFactsBlocState getCatFactsState() {
    return catFactsState;
  }

  fetchCatFacts(String endpoint) {
    fetchCatFactsSubscription?.cancel();
    catFactsState.loading = true;
    catFactsController.add(catFactsState);
    _apiClient.requestCatFacts(endpoint)
      .asStream()
      .listen((event) { 
        if (event is CatFacts) {
          catFactsState.catFacts = event;
          catFactsState.loading = false;
          catFactsController.add(catFactsState);
        }else {
          throw new Exception("Error while handling fetching cat facts");
        }
      });
  }
}