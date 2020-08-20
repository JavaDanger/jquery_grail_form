package formvalid

class FormController {

     def index() { }
    def countryChanged(long countryId) {
        Country country = Country.get(countryId)
        def states = []
        if ( country != null ) {
            states = State.findAllByCountry(country, [order:'name'])
        }
        render g.select(id:'subCategory', name:'subCategory.id',
                from:states, optionKey:'id', noSelection:[null:' ']
        )
    }
     def add_Student() {
        

        
            def addStudent = new Form(params)
            addStudent.save()
            render "Student added successfully"
        

    }
}
