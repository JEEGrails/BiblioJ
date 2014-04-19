import biblio.Auteur
import biblio.Livre
import biblio.Reservation
import biblio.TypeDocument

class BootStrap {

    def init = { servletContext ->
		
		def type1 = new TypeDocument(intitule: "Livre ado").save(failOnError : true)
		def type2 = new TypeDocument(intitule: "Nouveauté").save(failOnError : true)
		def type3= new TypeDocument(intitule: "Livre adulte").save(failOnError : true)
	
		def auteur1 = new Auteur(nom: "1",prenom:"Suzanne").save(failOnError : true)
		def auteur2 = new Auteur(nom: "2",prenom:"Kathryn").save(failOnError : true)
		def auteur3 = new Auteur(nom: "Carrère",prenom:"Emmanuel").save(failOnError : true)
		def auteur4 = new Auteur(nom: "4",prenom:"Haruki").save(failOnError : true)
		def auteur5 = new Auteur(nom: "5",prenom:"Grégoire").save(failOnError : true)
		def auteur6 = new Auteur(nom: "6",prenom:"Stieg").save(failOnError : true)

		def livre1 = new Livre(type: type1,titre: "Hunger games [Texte imprimé]",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre1.addToAuteurs(auteur1).save(failOnError : true)
		def livre2 = new Livre(type: type2,titre: "La couleur des sentiments",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre2.addToAuteurs(auteur2).save(failOnError : true)
		def livre3 = new Livre(type: type1,titre: "L'embrasement",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre3.addToAuteurs(auteur1).save(failOnError : true)
		def livre4 = new Livre(type: type2,titre: "Limonov",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre4.addToAuteurs(auteur3).save(failOnError : true)
		def livre5 = new Livre(type: type2,titre: "1Q84. 1. Avril-juin",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre5.addToAuteurs(auteur4).save(failOnError : true)
		def livre6 = new Livre(type: type2,titre: "1Q84. 3. Octobre-décembre",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre6.addToAuteurs(auteur4).save(failOnError : true)
		def livre7 = new Livre(type: type1, titre: "La révolte",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre7.addToAuteurs(auteur1).save(failOnError : true)
		def livre8 = new Livre(type: type3,titre: "La liste de mes envies",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre8.addToAuteurs(auteur5).save(failOnError : true)
		def livre9 = new Livre(type: type2,titre: "1Q84. 2. Juillet-septembre",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre9.addToAuteurs(auteur4).save(failOnError : true)
		def livre10 = new Livre(type: type3,titre: "La reine dans le palais des courants d'air [Texte imprimé]",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre10.addToAuteurs(auteur6).save(failOnError : true)
	   def res=new Reservation(code:"eee",dateReservation:new Date())
	    res.addToLivres(livre10).save(failOnError : true)
    }
    def destroy = {
    }
}
