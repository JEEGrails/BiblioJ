package biblio

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class TypeDocumentTests {

 

    void testConstraintIntituleNull() {
       def typeDocument = new TypeDocument()
	   assertFalse typeDocument.validate()
    }

	void testConstraintIntituleBlank() {
		def typeDocument = new TypeDocument(intitule : "")
		assertFalse typeDocument.validate()
	}

	void testConstraintsValidees() {
		def typeDocument = new TypeDocument(intitule : "Histoire")
		assertTrue typeDocument.validate()
	}
	
	void testToString() {
		def typeDocument = new TypeDocument(intitule : "Histoire")
		assertEquals("Histoire", typeDocument.toString())
	}
}
