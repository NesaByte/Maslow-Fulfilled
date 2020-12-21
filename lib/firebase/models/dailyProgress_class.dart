class DailyProgress {

  DailyProgress(
      this.sActualization,
      this.sEsteem,
      this.sBelonging,
      this.sSafety,
      this.sPhysiological,
      this.sDate);

  int sActualization = 0;
  int sEsteem        = 0;
  int sBelonging     = 0;
  int sSafety        = 0;
  int sPhysiological = 0;
  DateTime sDate     = new DateTime.now();
  String Id          = "id";

  DailyProgress.fromJson(Map<String, dynamic> parsedJSON, String id)
      : sActualization = parsedJSON['sActualization'],
        sEsteem        = parsedJSON['sEsteem'],
        sBelonging     = parsedJSON['sBelonging'],
        sSafety        = parsedJSON['sSafety'],
        sPhysiological = parsedJSON['sPhysiological'],
        sDate          = parsedJSON['sDate'].toDate(),
        Id = id {
    print("Collection: " +
        this.Id +
        "sActualization: " +
        this.sActualization.toString());
  }
}
