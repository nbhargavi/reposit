<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="application/javascript">
function loadJSON()
{
   var data_file = "Data.json";
   var http_request = new XMLHttpRequest();
   if (window.XMLHttpRequest)
   {
   xmlhttp=new XMLHttpRequest();
   }
 else
   {
   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
   }
 xmlhttp.onreadystatechange=function()
   {
   if (xmlhttp.readyState==4 && xmlhttp.status==200)
     {
     document.getElementById("t").innerHTML=xmlhttp.responseText;
     }
   }
   http_request.onreadystatechange  = function(){
      if (http_request.readyState == 4  )
      {
        // Javascript function JSON.parse to parse JSON data
        var jsonObj = JSON.parse(http_request.responseText);

        // jsonObj variable now contains the data structure and can
        // be accessed as jsonObj.name and jsonObj.country.
        document.getElementById("Name").innerHTML =  jsonObj.name;
        document.getElementById("Country").innerHTML = jsonObj.country;
      }
   }
   http_request.open("GET", data_file, true);
   http_request.send();
}
</script>

</head>
<body>
<h1>Cricketer Details</h1>
<table border="1"> 
<tr><th>Name</th><th>Country</th></tr>
<tr><td><div id="Name">Sachin</div></td>
<td><div id="Country">India</div></td></tr>
</table>

<div class="central">
<button type="button" onclick="loadJSON()">Update Details </button>
</div>
</body>
</html>