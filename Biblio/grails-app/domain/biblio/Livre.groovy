package biblio



class Livre {
	
	String titre
	int nombreExemplaires
	int nombreExemplairesDisponibles
	TypeDocument type
	
	static belongsTo = Auteur
    static hasMany = [auteurs:Auteur,reservations : Reservation]	
	static constraints = {
		titre(nullable:false)
		type (nullable : true)
		nombreExemplaires(min : 0)
		nombreExemplairesDisponibles(min : 0)
    }
		
}