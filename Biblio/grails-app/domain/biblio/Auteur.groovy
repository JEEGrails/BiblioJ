package biblio

class Auteur {

	String nom
	String prenom
	
	static hasMany = [livres : Livre]

    static constraints = {
		nom (nullable : false, blank : false)
		prenom (nullable : false, blank : false)
    }
	
	@Override
	public String toString() {
		return prenom+" "+nom;
	}
	
}
