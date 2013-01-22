<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ConnectionManager.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CharityWare</title>		
		
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style1.css" type="text/css" media="all">
			
		<script type="text/javascript" src="js/tabsScript.js"></script>

		<!-- Google Charts Stuff -->

		<!--Load the AJAX API-->
    	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    	<script type="text/javascript">

	      // Load the Visualization API and the piechart package.
	      google.load('visualization', '1.0', {'packages':['corechart']});
	
	      // Set a callback to run when the Google Visualization API is loaded.
	      google.setOnLoadCallback(drawChart);
	
	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart() {
	
	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'User');
	        data.addColumn('number', 'Records');
	        data.addRows([
			<%= DatabaseManager.readCharityDataV2() %>
	        ]);
	
	        // Set chart options
	        var options = {'title':'Records inputted by each User',
	                       'width':500,
	                       'height':400};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
    	</script>
    	
    	<!-- Google Charts Stuff -->
</head>
<body id="page1">
	<div class="body1">
		<div class="main">
	  
	    <!-- header -->
	    <header>    
	    <div class="wrapper">
	   		<h1 id="Mh1"> <a href="default.html" id="footer_logo"><span>&nbsp;Charity</span>Ware</a></h1>
	          <ul id="menubar">
		          <li><a href="default.html">Home</a></li> 
		          <li><a href="info.html">About Us</a></li>
			  </ul> 		
	    </div>
	    </header>
	    <!-- header -->
	    
	          
	    <!-- Main Content -->
	    <div class="wrapper">
	    	<p class="quot"> Help all charities to reach out to people and help them. The data exchange feature allows your charity workers to exchange data and be informed about what is happening around in the world. <img src="images/quot2.png" alt=""> </p>
	    </div>
	    
	    <article id="content">
	      <div class="wrapper">
	        <div class="box1">
	        
	        	<p> 
					<h2> UCL Administration Panel </h2> 
				</p>
								
				<div id="tabs">
			        <ul> 
			            <li><a href="javascript:tabSwitch(1,3,'tab_', 'content_');" id="tab_1" class="active">Requests</a></li>  
			            <li><a href="javascript:tabSwitch(2,3,'tab_', 'content_');" id="tab_2">Manage Accounts</a></li>  
			            <li><a href="javascript:tabSwitch(3,3,'tab_', 'content_');" id="tab_3">Statistics</a></li>  
			        </ul>
			    </div> 
			    <div class="tabbed_area">       
			       <div id="content_1" class="tabContent">
			         <form name="frmRequests" method="post" action="">
      					Manage Charity Requests
				        <br/>
				        <br/>
				        
						<table class="resultSet">
						<tr>
					          
				            <td>Serial Number </td>
				            <td>Charity Name </td>
				            <td>Charity ID </td>
						    <td>Charity Email </td>
						    <td>Purpose </td>
						    <td>Comments </td>
					        <td>Action </td>      
						 </tr>
						 <tr>
						    <td></td>
					        <td></td>
					        <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
					        <td><input type="radio" name="Action" value="yes" > Approve <br/>
						    <input type="radio" name="Action" value="no"> Decline </td>
						</tr>
				        </table>        
     				</form>
			     </div>
			     
			     <div id="content_2" class="tabContent">
			     		<ul id="menubar2">
				     		<li><a href =""> View Accounts </a> <b>|</b> </li>
	             	       	<li><a href = ""> Change Password Requests </a> <b>|</b> </li>
	                        <li><a href = ""> Delete Accounts </a></li>
                        </ul>
			     </div>  
			     
			     <div id="content_3" class="tabContent">
			     		<ul id="menubar2">
				     		<li><a href =""> Report 1 </a> <b>|</b> </li>
	             	       	<li><a href = ""> Report 2 </a> <b>|</b> </li>
	                        <li><a href = ""> Report 3 </a></li>
                        </ul>
			     
			     		<!--Div that will hold the pie chart-->
    					<div id="chart_div"></div>
			     </div>  
			    </div>  
				
	        </div>
	      </div>
		</article>
	    <!-- Main content -->
	    
	    
	    <!-- Contact Us Footer -->
	    <footer>	     
	      <div class="wrapper">
			  <h3>Contact Us</h3>
			  <div style="display:block; padding:10px;">
				  <div style="float:left; width:300px; display:inline-block;">
				  	University College London,<br/>
					Gower Street, <br/>
					London, WC1E 6BT <br/>
					<br/>
					Tel: +44 (0) 20 7679 2000 	
					<br/>
					
					<ul id="icons">
			          <li><a href="#" class="normaltip"><img src="images/icon1.gif" alt=""></a></li>
			          <li><a href="#" class="normaltip"><img src="images/icon2.gif" alt=""></a></li>
			          <li><a href="#" class="normaltip"><img src="images/icon3.gif" alt=""></a></li>
			          <li><a href="#" class="normaltip"><img src="images/pp.png" height="20" alt=""></a></li>
			        </ul>
				  </div>
				  
				  <div style="float:left; width:600px;display:inline-block;">
					<table style="border-spacing:5px;border-collapse: inherit;">
						<tr>
							  	<td>Name<br/>
							  		<input type="text" class="contactTextbox" style="width:240px;">
							  	</td>
							  	<td>Email<br/>
							  		<input type="text" class="contactTextbox" style="width:240px;">
							  	</td>
						</tr>
						<tr>
								<td colspan=2>Comment<br/>
							  		<textarea cols=70 height=150 class="contactTextbox"></textarea>
							  	</td>
						</tr>
						<tr>
							  	<td colspan=2>
							  		<input type="submit" value="SUBMIT" class="contactSubmit"/>
							  	</td>
						</tr>
				 	</table>
				 </div>
		     </div>
	     </div>
	      <!-- Contact Us Footer -->
	      
	      <div id="footer_text">Copyright &copy; <a href="http://www.ucl.ac.uk">UCL</a> All Rights Reserved &nbsp;&nbsp;&nbsp;&nbsp;
	        Design by <a target="_blank" href="http://www.ucl.ac.uk">UCL Computer Science</a></div>
	    </footer>
	    
	  </div>
	</div>
	</body>
</html>