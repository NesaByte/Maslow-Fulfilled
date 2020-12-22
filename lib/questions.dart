class Question{
  String qcategory;
  String qtext;
  bool qscore;

  Question(this.qcategory, this.qtext, this.qscore);
}

class QBank{
  List<Question> qbank = [
    Question('Physiological','Air', false),
    Question('Physiological','Water', false),
    Question('Physiological','Food', false),
    Question('Physiological','Shelter', false),
    Question('Physiological','Sleep', false),
    Question('Physiological','Clothing', false),
    Question('Physiological','Reproduction', false),

    Question('Safety', 'Personal Security', false),
    Question('Safety', 'Employment', false),
    Question('Safety', 'Resources', false),
    Question('Safety', 'Health', false),
    Question('Safety', 'Property', false),

    Question('Belong', 'Friendship', false),
    Question('Belong', 'Intimacy', false),
    Question('Belong', 'Family', false),
    Question('Belong', 'Sense of connection', false),

    Question('Esteem', 'Respect', false),
    Question('Esteem', 'Self-Esteem', false),
    Question('Esteem', 'Status', false),
    Question('Esteem', 'Recognition', false),
    Question('Esteem', 'Strength', false),
    Question('Esteem', 'Freedom', false),

    Question('Actualization','Desire to become the most that one can be', false),



  ];
}