<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJ4U663Pkt4uZv2ik0ZQ5-K-KRwoA6XMM&callback=initMap&libraries=&v=weekly"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
    <style type="text/css">
      #map {
        height: 100%;
      }

      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script>
        var map;
        var InforObj = [];
        var centerCords = {
            lat: 0,
            lng: 0
        };
        var jsonInput = '<s:property value="mapLoc"/>';
		var jsonStr = chts(jsonInput);
		var markersOnMap = JSON.parse(jsonStr);
        window.onload = function () {
            initMap();
        };

        function addMarkerInfo() {
            for (var i = 0; i < markersOnMap.length; i++) {
            	var obj = markersOnMap[i];
                var contentString = obj.infoWind;
                var latitude = parseFloat(obj.lat);
                var longitude = parseFloat(obj.lon);

                const marker = new google.maps.Marker({
                	icon:'<%=request.getContextPath()%>/images/ship.png',
                    position: {lat:latitude,lng:longitude},
                    map: map
                });

                const infowindow = new google.maps.InfoWindow({
                    content: contentString,
                    maxWidth: 500,
                    maxHeight: 100
                });
                 marker.addListener('mouseover', function () {
                     closeOtherInfo();
                     infowindow.open(marker.get('map'), marker);
                     InforObj[0] = infowindow;
                 });
                 marker.addListener('mouseout', function () {
                     closeOtherInfo();
                     infowindow.close();
                     InforObj[0] = infowindow;
                 });
            }
        }

        function closeOtherInfo() {
            if (InforObj.length > 0) {
                /* detach the info-window from the marker ... undocumented in the API docs */
                InforObj[0].set("marker", null);
                /* and close it */
                InforObj[0].close();
                /* blank the array */
                InforObj.length = 0;
            }
        }

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 3,
                center: centerCords
            });
            addMarkerInfo();
        }
        
        function chts(html){
			var temp = document.createElement("div");
		   		temp.innerHTML = html;
		   		return temp.textContent || temp.innerText || "";
		 }
        
    </script>
</head>
<body>
<s:form name="mapForm" >
	<s:token/>
</s:form>
<script type="text/javascript">

$(function () {
	try{
	var strutsToken = "<s:property value="#session['struts.tokens.token']" />"
	try{$('.token input').val(strutsToken);}catch(e){}
	try{window.opener.document.forms[0].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[1].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[2].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[3].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[4].token.value = strutsToken;}catch(e){}
	}catch(e){}
	});
	
	</script>
    <div id="map"></div>
</body>
</html>