package formvalid

class Country {
  static hasMany = [states: State]
    String name
    static constraints = {
    }
    String toString(){
        return name
    }
}
