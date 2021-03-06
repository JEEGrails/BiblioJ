<%@ page import="biblio.Livre" %>
<!DOCTYPE html>
<html>
	<head>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'tab.css')}" type="text/css">
	</head>
	<body>
	<div id="wrap">

       <div class="header">
       		<div class="logo" style="font-size: 28px">BiblioJ</div>            
        <div id="menu">
            <ul>                                                                       
            <li ><a class="home" href="${createLink(uri: '/')}">Acceuil</a></li>
            <li class="selected"><g:link controller="livre" action="listLivre">Liste des livres</g:link></li>
            
          </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
       	<div class="left_content">	
	<div class="clear"></div>
		<br/><br/>
	<g:form action="recherche" method="post">
		<br/><br/><span style="text-align: center; color: #039; font-size: 16px;">
		Recherche:</span><br/>
		<g:textField name="auteur"  placeholder="Auteur"  />
		<g:textField name="type" placeholder="Type" />
		<g:textField name="titre"  placeholder="Titre" />
		<g:submitButton  name="GoOOOOs!" />
	</g:form>
	<br/><br/><br/>
	<div  role="main">
			<table id="test">
				<thead>
					<th width="180"> Titre</th>
					
						<th>Type</th>
					<th>auteur</th>
						
						<th width="80">nombre Exemplaires</th>
					
						<th width="100">nombre Exemplaires Disponibles</th>
					<th width="60">Reserver</th>
					
				</thead>
				<tbody>
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
						
							<td>${livreInstance.auteurs}</td>
						
						
					<td>${fieldValue(bean: livreInstance, field: "nombreExemplaires")}</td>
					
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
		<div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        	
               
                
                
          <div class="cart">
            <div class="title"><span class="title_icon"><img src="${resource(dir: 'images', file: 'cart.gif')}" alt="Panier"/></span>Mon Panier</div>
          </div>
          <div class="about">
            <p>	
		
		<g:if test="${session.reservation}"> 
		
		<br/>
		<g:each in="${session.reservation.livres}" status="i" var="livreInstance">
					${livreInstance.titre}
					<g:link action="supprimer" controller="reservation" id="${livreInstance.id}">SUPPRIMER</g:link>
					<br/>
				</g:each>
				<g:link action="supprimerTout" controller="reservation">SUPPRIMER tout</g:link>
					
		</g:if>
		 </p>
             
          </div>
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"></div>
        <div class="right_footer">
        
       
        </div>
        
       
       </div>
    

</div>

</body>
</html>