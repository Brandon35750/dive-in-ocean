// init_mapbox.js
import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/marekredon/ckhyvdf2h01tc19lrki6k28uc'
    });


    // mapboxgl.accessToken = 'pk.eyJ1IjoibWFyZWtyZWRvbiIsImEiOiJja2d3ZjAybzEwOWdnMnRwOG1zNDNhc3B6In0.8998rUWrYideJqkSLe4Nng';
    // var map = new mapboxgl.Map({
    // container: 'map',
    // style: 'mapbox://styles/mapbox/streets-v11',
    // center: [142.591669, 11.373335],
    // zoom: 3,
    // minZoom: 3,
    // maxZoom: 5
    // });



      map.on('load', function () {
      map.addSource('10m-bathymetry-81bsvj', {
      type: 'vector',
      url: 'mapbox://mapbox.9tm8dx88'
      });
       
      map.addLayer(
      {
      'id': '10m-bathymetry-81bsvj',
      'type': 'fill',
      'source': '10m-bathymetry-81bsvj',
      'source-layer': '10m-bathymetry-81bsvj',
      'layout': {},
      'paint': {
      'fill-outline-color': 'hsla(350, 82%, 62%, 0)',
      // cubic bezier is a four point curve for smooth and precise styling
      // adjust the points to change the rate and intensity of interpolation
      'fill-color': [
      'interpolate',
      ['cubic-bezier', 0, 1, 1, 1],
      ['get', 'DEPTH'],
      100,
      '#78bced',
      11000,
      '#15659f'
      ]
      }
      },
      // 'land-structure-polygon'
      );
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
export { initMapbox };

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


