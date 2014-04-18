package biblio

class TypeDocument {
	String intitule

    static constraints = {
		intitule (nullable : false, blank : false)
	}
	
	@Override
	public String toString() {
		return intitule;
	}
}
