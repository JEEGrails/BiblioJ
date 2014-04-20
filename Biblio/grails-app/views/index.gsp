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
            <li class="selected"><a >Acceuil</a></li>
            
            <li><g:link controller="livre" action="listLivre">Liste des livres</g:link></li>
            
          </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
		
		<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="${resource(dir: 'images', file: 'bullet1.gif')}" alt="titres"  /></span>Titres plus recherchés</div>
        
        	<div class="feat_prod_box">
        	<div class="prod_img"><img src="${resource(dir: 'images', file: 'opposeNuit.jpg')}" alt="nuit" width="98" height="150"  border="0" /></div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">Rien ne s'oppose à la nuit</div>
                    <p class="details">Delphine de Vigan, suite au suicide de sa mère, écrit sur celle-ci dans un roman en trois parties. L'enfance de Lucile (sa mère), et sa vie d'adulte qui débute réellement à la naissance de l'auteur.</p>
                    <a  class="more">- Reserver -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            
            	<div class="prod_img"><img src="${resource(dir: 'images', file: 'Hunger.jpg')}" alt="Hunger" width="98" height="150" border="0" /></div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">The Hunger Games</div>
                    <p class="details">Cette histoire raconte l'aventure de Katniss Everdeen. Elle vit dans un  pays se nommant Panem. Dans ce pays, il existe douze districts dirigés par un puissant gouvernement : le Capitole. Il dirige Panem depuis la période de guerre qui a détruit le 13 ème district..</p>
                    <a  class="more">- Reserver -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            
            </div>
       	   <div class="title"><span class="title_icon"><img src="${resource(dir: 'images', file: 'bullet2.gif')}" alt="nouveaux"  /></span>Nouveaux Livres</div> 
           
           <div class="new_products">
           
                    <div class="new_prod_box">
                        L'art français de la guerre
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${resource(dir: 'images', file: 'new_icon.gif')}" alt="New"  /></span>
                        <img src="${resource(dir: 'images', file: 'artFrancais.jpeg')}" alt="film" width="60" height="90" class="thumb" border="0" />
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        1Q84. 2. Juillet-septembre
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${resource(dir: 'images', file: 'new_icon.gif')}" alt="New"  /></span>
                        <img src="${resource(dir: 'images', file: '1q84.jpg')}" alt="film" width="60" height="90" class="thumb" border="0" />
                        </div>          
                    </div>                    
                    
                    <div class="new_prod_box">
                        La couleur des sentiments
                        <div class="new_prod_bg">
                        <span class="new_icon"> <img src="${resource(dir: 'images', file: 'new_icon.gif')}" alt="New"  /></span>
                        <img src="${resource(dir: 'images', file: 'couleurSentiments.jpg')}" alt="film" width="60" height="90" class="thumb" border="0" />
                        </div>           
                    </div>          
            
            </div> 
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
		
				
			
		 <div class="right_content">
        	
               
                
                
          <div class="cart">
            <div class="title"><span class="title_icon"><img src="${resource(dir: 'images', file: 'cart.gif')}" alt="Panier" /></span>Mon Panier</div>
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
          <h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
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
