package biblio


class Reservation {

    
	String code
	Date dateReservation
	
	static hasMany = [livres : Livre]
	static belongsTo = Livre

	static constraints = {
		code(nullable:false)
	}
	
	@Override
	public String toString() {
		return code;
	}
	
	
}
