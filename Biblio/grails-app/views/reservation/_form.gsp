<%@ page import="biblio.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="reservation.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${reservationInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dateReservation', 'error')} required">
	<label for="dateReservation">
		<g:message code="reservation.dateReservation.label" default="Date Reservation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReservation" precision="day"  value="${reservationInstance?.dateReservation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'livres', 'error')} ">
	<label for="livres">
		<g:message code="reservation.livres.label" default="Livres" />
		
	</label>
	
</div>

