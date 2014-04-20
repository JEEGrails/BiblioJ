<%@ page import="biblio.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		
		
	</head>
	<body>
		
	
	<div class="nav" role="navigation">
		<g:if test="${session.reservation}"> 
			<table id="test">
				<thead>
					<tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
						
	
					
					
					
					</tr>
				</thead>
				<tbody>
			
				<g:each in="${session.reservation.livres}" status="i" var="livreInstance">
					<tr >
		
							<td>${livreInstance.titre}</td>

					</tr>
				</g:each>
			
				
				</tbody>
			</table>
				<g:link class="reservation" action="validerPanier">VALIDATE</g:link>
			</g:if>
		<g:if test="${reservationInstance}" >
		yupiiiii   CODE :${reservationInstance.code}<br/> liste livre :${reservationInstance.livres}
		
		<g:form action="envoiMail" controller="reservation" method="post">
		
		<g:field type="email" name="email"  placeholder="email"/>
		<g:hiddenField name="code" value="${reservationInstance.code}" />
		<g:hiddenField name="livres"  value="${reservationInstance.livres}"/>
		<g:submitButton  name="envoi!" />
	</g:form>
		</g:if>
		<br/>
		<g:if test="${session.listLivreIndisponible}" >
		<g:each in="${session.listLivreIndisponible}" status="i" var="l">
		erf plus de livre    :${l}<br/>
		</g:each>
		
		</g:if>
		</div>
		
		
	</body>
</html>