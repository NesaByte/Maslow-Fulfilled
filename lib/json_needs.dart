

class json_needs {
  String mdate;
  int actualization;
  int esteem;
  int belonging;
  int safety;
  int physiological;

  json_needs(
      {this.mdate, this.actualization, this.esteem, this.belonging, this.safety, this.physiological});

  json_needs.fromJson(Map<String, dynamic> json) {
    mdate         = json['mdate'];
    actualization = json['actualization'];
    esteem        = json['esteem'];
    belonging     = json['belonging'];
    safety        = json['safety'];
    physiological = json['physiological'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mdate']         = this.mdate;
    data['actualization'] = this.actualization;
    data['esteem']        = this.esteem;
    data['belonging']     = this.belonging;
    data['safety']        = this.safety;
    data['physiological'] = this.physiological;
    return data;
  }
}