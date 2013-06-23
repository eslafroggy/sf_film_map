$(function () {
  var defaultLatLng = new google.maps.LatLng(37.7750, -122.4183);
  google.maps.visualRefresh = true;
  var map = window.map = new google.maps.Map(document.querySelector("#map-canvas"), {
    center: defaultLatLng,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var markers = {};

  var infowindow= new google.maps.InfoWindow({maxWidth:300});

  google.maps.event.addListener(map, "bounds_changed", function () {
    var bounds, marker;

    bounds = map.getBounds();

    if (!bounds) {
      return;
    }

    locationData.forEach(function (location, index) {
      if (!markers[location.id]) {
        if (!location._latlng) {
          location._latlng = new google.maps.LatLng(
            location.latitude,
            location.longitude
          );
        }

        if (bounds.contains(location._latlng)) {
          marker = markers[location.id] = new google.maps.Marker({
            position: location._latlng,
            map: map,
            title: location.address
          });
          addClickListener(marker,location);
        }
      }
    });
  });

  function addClickListener(marker,currentLocation) {
    google.maps.event.addListener(marker, 'click', function() {
      var infoWindowhtml = '<a href="/movies/' + currentLocation.movie_id + '">' + movieData[currentLocation.movie_id].movie_title + '</a><br />';

      if (currentLocation.fun_fact) {
        infoWindowhtml += 'Fun Fact:' + currentLocation.fun_fact;
      }
      infowindow.setContent(infoWindowhtml);
      infowindow.open(map,marker);
    });

  }

  


  document.querySelector("form").addEventListener("submit", function (event) {
    event.preventDefault();

    var geocoder = new google.maps.Geocoder;

    geocoder.geocode({ address:
      document.querySelector("input").value
    }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
      } else {
        console.error("Google geocoding failed, fool!");
      }
    });
  }, false);
});
