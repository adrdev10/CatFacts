class CatFacts {
  List<String> facts;

  CatFacts.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["all"];
    this.facts = list.map((v) {
      String fact = v["text"];
      return fact;
    }).toList();
  } 
}

