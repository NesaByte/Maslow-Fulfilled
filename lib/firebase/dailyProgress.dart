class dailyProgress {

  dailyProgress(
      this.SActualization,
      this.SEsteem,
      this.SBelonging,
      this.SSafety,
      this.SPhysiological,
      this.SDate);

  int SActualization = 0;
  int SEsteem        = 0;
  int SBelonging     = 0;
  int SSafety        = 0;
  int SPhysiological = 0;
  DateTime SDate     = new DateTime.now();

  dailyProgress.fromJson(Map<String, dynamic> parsedJSON, String id)
      : SActualization = parsedJSON['SActualization'],
        SEsteem        = parsedJSON['SEsteem'],
        SBelonging     = parsedJSON['SBelonging'],
        SSafety        = parsedJSON['SSafety'],
        SDate          = parsedJSON['SDate'].toDate();
}
