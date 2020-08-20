package formvalid

class State {
String name
    static belongsTo = Country
    Country country
    static constraints = {
    }
    String toString(){
     return name
    }
}
