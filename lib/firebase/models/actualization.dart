class Actualization {

  Actualization(
      this.qa1,
      this.qa2,
      this.qa3,
      this.qa4,
      this.qa5,
      this.qa6,
      this.qa7,
      this.qa8
      );

  String qa1 = "qa1";
  String qa2 = "qa2";
  String qa3 = "qa3";
  String qa4 = "qa4";
  String qa5 = "qa5";
  String qa6 = "qa6";
  String qa7 = "qa7";
  String qa8 = "qa8";
  String Id  = "id";

  Actualization.fromJson(Map<String, dynamic> parsedJSON, String id)
      : qa1 = parsedJSON['qa1'],
        qa2 = parsedJSON['qa2'],
        qa3 = parsedJSON['qa3'],
        qa4 = parsedJSON['qa4'],
        qa5 = parsedJSON['qa5'],
        qa6 = parsedJSON['qa6'].toDate(),
        qa7 = parsedJSON['qa7'],
        qa8 = parsedJSON['qa8'],
        Id  = id {
    print("Collection: " +
        this.Id +
        "qa1: " +
        this.qa1);
  }
}
