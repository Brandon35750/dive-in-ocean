// init_mapbox.js
import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-19.508243, 14.698701],
      zoom: 1.8
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    map.on('load', () => {
      map.addSource('tags', {
        type: 'geojson',
        data: {features: markers},
        cluster: true,
        clusterMaxZoom: 10, // Max zoom to cluster points on
        clusterRadius: 50
      })

      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'tags',
        filter: ['has', 'point_count'],
        paint: {
          'circle-color': [
            'step',
            ['get', 'point_count'],
            'rgba(120, 255, 255, 0.9)', // couleur petit point
            10, // jusqu'à ce nombre de point
            'rgba(245, 211, 0, 0.95)', // couleur gros point
            20,
            'rgba(241, 134, 104, 1)' // couleur mega gros point qu'on n'a pas encore
          ],
          'circle-radius': [
            'step',
            ['get', 'point_count'],
            20,  // px
            30,  // jusqu'à ce nombre de point
            35,  // px
            40, // jusqu'à ce nombre de point
            50   // px pour au delà
          ]
        }
      });

      map.addLayer({
        id: 'unclustered-point',
        type: 'circle',
        source: 'tags',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'circle-color': '#FF0F7E',
          'circle-radius': 20,
          'circle-stroke-width': 1,
          'circle-stroke-color': '#fff'
        }
      });

      map.addLayer({
        id: 'unclustered-point-count',
        type: 'symbol',
        source: 'tags',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'text-color': '#fff'
        },
        layout: {
          'text-field': "{species}",
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 10,
        }
      });

      map.addLayer({
        id: 'cluster-count',
        type: 'symbol',
        source: 'tags',
        filter: ['has', 'point_count'],
        layout: {
          'text-field': '{point_count_abbreviated}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 10
        }
      });

      map.on('click', 'clusters', function(e) {
        const features = map.queryRenderedFeatures(e.point, {
          layers: ['clusters']
        });
        const clusterId = features[0].properties.cluster_id;
        map.getSource('tags').getClusterExpansionZoom(
          clusterId,
          function(err, zoom) {
          if (err) return;

          map.easeTo({
            center: features[0].geometry.coordinates,
            zoom: zoom
          });
        });
      });

      map.on('click', 'unclustered-point', function(e) {
        const coordinates = e.features[0].geometry.coordinates.slice();
        const infoWindow    = e.features[0].properties.infoWindow;
        new mapboxgl.Popup()
          .setLngLat(coordinates)
          .setHTML(infoWindow)
          .addTo(map)
      });

    });

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





