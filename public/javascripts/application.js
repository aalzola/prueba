// mostrar|ocultar capa de selección de fecha final
function ends_date_layer(checked) {
    if($("ends_at_select")){
        if(checked == true) $("ends_at_select").show();
        else  $("ends_at_select").hide();
    }
}


// posiciona una capa absoluta con su _locator
function locate_div(layer) {
    if($(layer) && $(layer+"_locator")) {
        $(layer).show()
        var pos = Element.cumulativeOffset($(layer+"_locator"))
        $(layer+"_locator").style.height = ($(layer).offsetHeight+10)+"px"
        $(layer).style.top = pos[1]+"px"
        $(layer).style.left = pos[0]+"px"
    }
}


// mapas en creación
var map;
var center;
var marker;
var address = "";

function initialize_map(lat, long) {
	// alert ("initialize_map");
    if($("map")) {
        map = new google.maps.Map2(document.getElementById("map"));
        // marcamos el centro aquí por ponerlo en algún sitio
        if(lat && long) {
            center = new google.maps.LatLng(lat,long);
        } else {
            center = new google.maps.LatLng(40.453955,-3.700356);
        }
        map.addControl(new GSmallMapControl());
        map.setCenter(center, 16);
        if(lat && long) {
            marker = new GMarker(center);
            map.addOverlay(marker);
        } else {
            marker = new GMarker(center, {draggable: true});
            GEvent.addListener(marker, "dragstart", function() {
              });
            GEvent.addListener(marker, "dragend", function() {
                set_map();
              });
            map.addOverlay(marker);
        
            if(address != "") {
                showAddress(address);
                address="";
            }
        }
    }
}

function get_address() {
  //alert ("get_adress");
  if ($('matter_address').value == "") {
       address = "";
  } else { 
    address = $('matter_address').value;
    address += ", " + $('cityCouncil_city').value;
    address += ", españa" 
  }
}

function set_map() {
	//alert ("Asignamos direción");
    $("matter_latitude").value = marker.getLatLng().lat();
    $("matter_longitude").value = marker.getLatLng().lng();
}

function nullify_map() {
    $("matter_latitude").value = "";
    $("matter_longitude").value = "";
}


function showAddress(address) {
  //alert ("showAddress");
  var geocoder = new GClientGeocoder();
  geocoder.getLatLng(
    address,
    function(point) {
      if (!point) {
        // alert(address + " no encontrada");
      } else {
        map.setCenter(point, 16);
        marker.setLatLng(point);
		set_map();
      }
    }
  );
}