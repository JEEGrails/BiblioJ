<%@ page import="biblio.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		
		
	</head>
	<body>
		
	<g:form action="recherche" method="post">
		
		<g:field type="text" name="Recherche" value="Recherche"/>
		<g:textField name="auteur"  placeholder="Auteur"  />
		<g:textField name="type" placeholder="Type" />
		<g:textField name="titre"  placeholder="Titre" />
		<g:submitButton  name="GoOOOOs!" />
	</g:form>
	<div class="nav" role="navigation">
			<table id="test">
				<thead>
					<tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
						<th><g:message code="livre.type.label" default="Type" /></th>
					<th>auteur</th>
						
					
					
						<g:sortableColumn property="nombreExemplairesDisponibles" title="${message(code: 'livre.nombreExemplairesDisponibles.label', default: 'Nombre Exemplaires Disponibles')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
						
							<td>${livreInstance.auteurs}</td>
						
						
					
						<td>${fieldValue(bean: livreInstance, field: "nombreExemplairesDisponibles")}</td>
						
						<td>
						<g:if test="${livreInstance.nombreExemplairesDisponibles}">
						<g:link action="reserver" controller="reservation" id="${livreInstance.id}">reserver</g:link>
					</g:if>
					<g:if test="${!livreInstance.nombreExemplairesDisponibles}">
						Indisponible
					</g:if></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${livreInstanceTotal}" action="recherche" total="${livreInstanceTotal}" />
			</div>
		</div>
		
		<g:if test="${session.reservation}"> 
		
		<br/>
		<g:each in="${session.reservation.livres}" status="i" var="livreInstance">
					${livreInstance.titre}
					<g:link action="supprimer" controller="reservation" id="${livreInstance.id}">SUPPRIMER</g:link>
					<br/>
				</g:each>
				<g:link action="supprimerTout" controller="reservation">SUPPRIMER tout</g:link>
					
		</g:if>
	</body>
</html>