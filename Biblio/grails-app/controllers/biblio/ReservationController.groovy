package biblio

import org.springframework.dao.DataIntegrityViolationException

class ReservationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def create() {
        [reservationInstance: new Reservation(params)]
    }

    def save() {
        def reservationInstance = new Reservation(params)
        if (!reservationInstance.save(flush: true)) {
            render(view: "create", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def show(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def edit(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def update(Long id, Long version) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reservationInstance.version > version) {
                reservationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reservation.label', default: 'Reservation')] as Object[],
                          "Another user has updated this Reservation while you were editing")
                render(view: "edit", model: [reservationInstance: reservationInstance])
                return
            }
        }

        reservationInstance.properties = params

        if (!reservationInstance.save(flush: true)) {
            render(view: "edit", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def delete(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        try {
            reservationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "show", id: id)
        }
    }
	def reserver(Long id){

	
	
		
		def session = request.getSession(true);
		if(!session.getAttribute("reservation")) {
			session.setAttribute("reservation", new Reservation(code : "none",livres:new HashSet()))
		}

		
		
		def reservation= (Reservation) session.getAttribute("reservation")
		
		
	
			
				Livre l= Livre.findById(id)
		
				
				
				boolean exist=false;
			//	l?.reservations?.add(reservation)
				
				for(monlivre in reservation.livres)
				{if(monlivre?.titre.equals(l?.titre))
					exist=true
				}
			
				if(!exist)
				reservation.livres.add(l)
				
			
			println reservation.livres.toString()
		session.setAttribute("reservation", reservation)
		def test=session["reservation"]
		println test.livres.isEmpty()
		redirect(action: "listLivre", controller:"livre")
	}
	
	def supprimer(Long id)
	{def reservation= (Reservation) session.getAttribute("reservation")
		for(mlivre in reservation.livres)
		{
			if(mlivre?.id==id)
			{
		reservation?.livres.remove(mlivre)
		break;
		}
		
		}
		
		session.setAttribute("reservation", reservation)
		
		redirect(action: "listLivre", controller:"livre")
		}
	def supprimerTout()
	{def reservation= (Reservation) session.getAttribute("reservation")
		
		//reservation?.livres.removeAll();
		
		session.invalidate();
		//session.setAttribute("reservation", reservation)
		
		redirect(action: "listLivre", controller:"livre")
		}
	def panier()
	{
		
		
	}
	
	
	def validerPanier()
	{
		
		String codes =  org.apache.commons.lang.RandomStringUtils.randomAlphanumeric(8)
		while(Reservation.findByCode(codes) != null) {
			codes = org.apache.commons.lang.RandomStringUtils.randomAlphanumeric(8)
		}
		
		def reservation= (Reservation) session.getAttribute("reservation")
	List<Livre> listLivreIndisponible=new ArrayList<>();
	def reservationInstance = new Reservation(code:codes,dateReservation:new Date())
	reservationInstance.livres=new HashSet();
	
		for(livre in reservation.livres)
		{
			Livre l =Livre.findById(livre?.id)
		if(l.nombreExemplairesDisponibles)	{
			l.setNombreExemplairesDisponibles(l.nombreExemplairesDisponibles-1)
		
	
			
	
			if (!l.save(flush: true)) {
				render(view: "panier")
				return
			}	
			reservationInstance.livres.add(l);
			reservationInstance.addToLivres(l).save();
				
			}
		else
		{
			listLivreIndisponible.add(l);
			
			}
		
		}
		session["listLivreIndisponible"]=listLivreIndisponible
		
		session["reservation"]=null
		render(view: "panier", model: [reservationInstance: reservationInstance])
	
		
	}
	
	  def envoiMail(){
		 String email= request.getParameter("email")
		 def code=request.getParameter("code")
		 def livres=request.getParameter("livres")
		 
		 sendMail {
			 to email
			 subject "Reservation Sur BiblioJ"
			html "<body>Bonjour<br/> votre code de reservation est :"+code+" <br/> vous avez commandez"+livres+"              </body>"
		   }
		 redirect(action: "listLivre", controller: "livre" )
	  }
}

    

