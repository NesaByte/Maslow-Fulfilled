/**
 * event class
 * will be CRM to databse
 * the class contains the need's info;
 *
 * Quest: create the database And Mapping to databse;
 */

class Needs {
  DateTime mdate;
  int actualization;
  int esteem;
  int belonging;
  int safety;
  int physiological;

  //constructor
  Needs(DateTime d, int a, int e, int b, int s, int p){
    this.mdate = d;
    this.actualization = a;
    this.esteem = e;
    this.belonging = b;
    this.safety = s;
    this.physiological = p;
  }

  //Setters
  void setmDate(DateTime d){ this.mdate = d;}
  void setActualization(int a){ this.actualization = a;}
  void setEsteem(int e){ this.esteem = e;}
  void setBelonging(int b){ this.belonging = b;}
  void setSafety(int s){ this.safety = s;}
  void setPhysiological(int p){ this.physiological = p;}

  //Getters
  DateTime getmDate(){ return this.mdate; }
  int getActualization() { return this.actualization;}
  int getEsteem() { return this.esteem;}
  int getBelonging() { return this.belonging;}
  int getSafety() { return this.safety;}
  int getPhysiological() { return this.physiological;}

}