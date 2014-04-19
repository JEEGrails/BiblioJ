package biblio



class Livre {
	
	String titre
	int nombreExemplaires
	int nombreExemplairesDisponibles
	TypeDocument type
	
	
	static belongsTo = [Auteur, Reservation] 
    static hasMany = [auteurs:Auteur,reservations : Reservation]	
	
	static mapping = {
		auteurs fetch:"join"
		reservations fetch:"join"
		
		 }
	
	static constraints = {
		titre(nullable:false)
		type (nullable : true)
		nombreExemplaires(min : 0)
		nombreExemplairesDisponibles(min : 0)
    }
		
}