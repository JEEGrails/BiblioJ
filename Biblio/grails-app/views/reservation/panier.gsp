<%@ page import="biblio.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		
		<title>BiblioJ</title>
		
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
            <div class="title"><span class="title_icon"><img src="${resource(dir: 'images', file: 'cart.gif')}" alt="Panier"/></span>Mon Panier</div><br/><br/><br/>
        <div class="nav" role="navigation">
		<g:if test="${session.reservation}"> 
        	<div class="feat_prod_box_details">
            
            <table class="cart_table" align="center">
            	<tr class="cart_title">
                	<td>Titre</td>
                	              
                </tr>
    
				<tbody>
			
				<g:each in="${session.reservation.livres}" status="i" var="livreInstance">
					<tr >
		
							<td><g:link action="supprimer" controller="reservation" id="${livreInstance.id}"><img src="${resource(dir: 'images', file: 'Delete.png')}" width="21" height="18" alt="Panier"/>
							&nbsp;&nbsp;</g:link>	<span style="text-align: center; color: #039; font-size: 16px;">${livreInstance.titre}</span>
				</td>

					</tr>
				</g:each>
			
				<tr>
				<td>	<br/><br/><br/>			<g:link action="supprimerTout" controller="reservation"><img src="${resource(dir: 'images', file: 'DeleteAll.png')}" width="60" height="80" alt="Vider le panier" title="Vider le panier"/></g:link>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:link class="reservation" action="validerPanier"><img src="${resource(dir: 'images', file: 'valider.png')}" width="60" height="80" alt="Valider" title="Valider"/></g:link></td></tr>
				</tbody>
			</table>

			</g:if>
		<g:if test="${reservationInstance}" >
		 <span style="text-align: center; color: #F60; font-size: 16px;">Code de Reservation :</span>
		<span style="text-align: center; color: #039; font-size: 16px;">&nbsp; &nbsp;${reservationInstance.code}</span><br/><br/><br/>
		<span style="text-align: center; color: #F60; font-size: 16px;"> liste des livres reservés :</span><ul>
		<g:each in="${reservationInstance.livres}" status="i" var="l">
		<span style=" color: #039; font-size: 16px;">&nbsp; &nbsp;<li>${l}</li></span>
		</g:each></ul>
		<div class="clear"></div>
		<br/><br/><br/><br/><span style="text-align: center; color: #039; font-size: 16px;">Entrer votre adresse mail pour recevoir votre code de reservation :</span>
		<br/><br/><br/><g:form action="envoiMail" controller="reservation" method="post">
		
		<g:field type="email" name="email"  placeholder="email"/>
		<g:hiddenField name="code" value="${reservationInstance.code}" />
		<g:hiddenField name="livres"  value="${reservationInstance.livres}"/>
		<g:submitButton  name="envoi!" />
	</g:form>
		</g:if>
		<br/>
		
		<g:if test="${session.listLivreIndisponible}" >
		<g:each in="${session.listLivreIndisponible}" status="i" var="l">
		<span style="text-align: center; color: #F60; font-size: 16px;">  ces Livre(s) ne sont plus disponible(s):</span> <span style="text-align: center; color: #039; font-size: 16px;">${l}</span><br/>
		</g:each>
		
		</g:if>
		
		</div>
	 </div>	
       <div class="clear"></div>
        </div><!--end of left content-->	
	 <div class="right_content">
        	
               
                
                
          
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"></div>
        <div class="right_footer">
        
       
        </div>
        
       
       </div>
    



</body>
</html>