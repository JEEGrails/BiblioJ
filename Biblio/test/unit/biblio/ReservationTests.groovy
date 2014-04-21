package biblio



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Reservation)
class ReservationTests {

   void testConstraintCodeNull() {
       def reservation = new Reservation();
	   assertFalse reservation.validate()
    }

	void testConstraintsValidees() {
		def reservation = new Reservation(code : "NULL", dateReservation : new Date())
		assertTrue reservation.validate()
	}

	void testToString() {
		def reservation = new Reservation(code : "NULL", dateReservation : new Date())
		assertEquals("NULL", reservation.toString())
	}
}
