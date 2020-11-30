// init_mapbox.js
import mapboxgl from 'mapbox-gl';


const initMapboxNewTag = () => {
  const mapElement = document.getElementById('map-new-tag');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-new-tag',
      style: 'mapbox://styles/mapbox/streets-v11',
      zoom: 0
    });

    const markers = [];
    map.on('click', function (e) {
      // document.getElementById('info').innerHTML =
      // '<br />' +
      // e.lngLat is the longitude, latitude geographical position of the event
      const lngLat = e.lngLat.wrap();

      const oldMarker = markers.pop();
      if (oldMarker) oldMarker.remove();
    
      const newMarker = new mapboxgl.Marker()
      .setLngLat([ lngLat.lng, lngLat.lat ])
      .addTo(map);
      markers.push(newMarker)
      console.log(markers)
    });   
  };
};



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add popups
        .addTo(map);
    });

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 3, duration: 0 });
    };

    fitMapToMarkers(map, markers);
    }
};
export { initMapbox, initMapboxNewTag};

// zoom effect de JJ
// var map = new mapboxgl.Map({
// container: 'map',
// style: 'mapbox://styles/mapbox/streets-v11',
// center: [-73.5804, 45.53483],
// pitch: 60,
// bearing: -60,
// zoom: 10
// });


//cours geocoding sur customs markers (2)
// markers.forEach((marker) => {
//   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

//   // Create a HTML element for your custom marker
//   const element = document.createElement('div');
//   element.className = 'marker';
//   element.style.backgroundImage = `url('${marker.image_url}')`;
//   element.style.backgroundSize = 'contain';
//   element.style.width = '25px';
//   element.style.height = '25px';

//   // Pass the element as an argument to the new marker
//   new mapboxgl.Marker(element)
//     .setLngLat([marker.lng, marker.lat])
//     .setPopup(popup)
//     .addTo(map);
// });


