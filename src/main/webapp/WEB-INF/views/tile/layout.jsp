<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
html,body{
	margin: 0px;
	padding: 0px;
}
#container{
   width: 100%;
   margin: 0px auto;
/*    text-align: center; */
   border: 0px solid #bcbcbc;

}
#header{
   padding: 5px;
   margin-bottom: 5px;
   border: 0px solid #bcbcbc;
   background-color: white;

}
#content{
   width: 100%;
   padding: 5px;
   margin-right: 5px;
/*    float: left; */
   border: 0px solid #bcbcbc;
   clear: both;
}
#footer{
	clear: both;
	
   padding: 0px;
   border: 0px solid #bcbcbc;
   background-color: lightblue;
   height: 250px;
/*       position: absolute;    */
/*      bottom: 0;   */
/*     width: 100%; */ 

} 
</style>

<title>
 	<tiles:insertAttribute name="title" />
</title>
</head>
<body>
<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="content">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>