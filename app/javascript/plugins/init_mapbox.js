// init_mapbox.js
import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-17.508243, 14.698701],
      zoom: 1.2
    });

    // addZoomOnClusters(map, markers);

    // const markers = JSON.parse(mapElement.dataset.markers);
    // markers.forEach((marker) => {
    //   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    //   new mapboxgl.Marker()
    //     .setLngLat([ marker.lng, marker.lat ])
    //     .setPopup(popup) // add popups
    //     .addTo(map);
    // });

    // const fitMapToMarkers = (map, markers) => {
    //   const bounds = new mapboxgl.LngLatBounds();
    //   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    //   map.fitBounds(bounds, { padding: 200, maxZoom: 3, duration: 0 });
    // };

    // fitMapToMarkers(map, markers);

    const markers = JSON.parse(mapElement.dataset.markers);

    map.on('load', () => {
      map.addSource('tags', {
        type: 'geojson',
        data: markers,
        cluster: true,
        clusterMaxZoom: 8, // Max zoom to cluster points on
        clusterRadius: 100
      })

      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'tags',
        filter: ['has', 'point_count'],
        paint: {
          // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
          // with three steps to implement three types of circles:
          //   * Blue, 20px circles when point count is less than 100
          //   * Yellow, 30px circles when point count is between 100 and 750
          //   * Pink, 40px circles when point count is greater than or equal to 750
          'circle-color': [
            'step',
            ['get', 'point_count'],
            'rgba(241, 134, 104, 0.7)', // couleur petit point
            100, // jusqu'à ce nombre de point
            'rgba(241, 134, 104, 0.9)', // couleur gros point
            200,
            'rgba(241, 134, 104, 1)' // couleur mega gros point qu'on n'a pas encore
          ],
          'circle-radius': [
            'step',
            ['get', 'point_count'],
            20,  // px
            40,  // jusqu'à ce nombre de point
            30,  // px
            100, // jusqu'à ce nombre de point
            40   // px pour au delà
          ]
        }
      });

      map.addLayer({
        id: 'unclustered-point',
        type: 'circle',
        source: 'users',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'circle-color': '#2E38CB',
          'circle-radius': 15,
          'circle-stroke-width': 1,
          'circle-stroke-color': '#fff'
        }
      });

      map.addLayer({
        id: 'unclustered-point-count',
        type: 'symbol',
        source: 'users',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'text-color': '#fff'
        },
        layout: {
          'text-field': '{userCount}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 12,
        }
      });

      map.addLayer({
        id: 'cluster-count',
        type: 'symbol',
        source: 'users',
        filter: ['has', 'point_count'],
        layout: {
          'text-field': '{point_count_abbreviated}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 12
        }
      });

      // map.on('click', 'clusters', function(e) {
      //   const features = map.queryRenderedFeatures(e.point, {
      //     layers: ['clusters']
      //   });
      //   const clusterId = features[0].properties.cluster_id;
      //   map.getSource('users').getClusterExpansionZoom(
      //     clusterId,
      //     function(err, zoom) {
      //     if (err) return;

      //     map.easeTo({
      //       center: features[0].geometry.coordinates,
      //       zoom: zoom
      //     });
      //   });
      // });


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



// Code Hugo
// import mapboxgl from 'mapbox-gl';

// // const fitMapToMarkers = (map, markers) => {
// //   const bounds = new mapboxgl.LngLatBounds();
// //   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
// //   map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 0 });
// // };

// const addZoomOnClusters = (map, locationInfoCards) => {
//   locationInfoCards.forEach(infoCard => {
//     infoCard.addEventListener('click', event => {
//       highlightInfoCard(infoCard.dataset.location, locationInfoCards);
//       const coordinates = JSON.parse(infoCard.dataset.coordinates);
//       map.easeTo({
//         center: coordinates,
//         zoom: 10
//       });
//     });
//   });
// };

// const highlightInfoCard = (location, locationInfoCards) => {
//   const currentInfoCard   = document.getElementById(location + '-info-card')
//   locationInfoCards.forEach(infoCard => infoCard.style.removeProperty("border"));
//   locationInfoCards.forEach(infoCard => infoCard.classList.remove('active'));
//   // locationInfoCards.forEach(infoCard => infoCard.style.removeProperty("background-color"));
//   currentInfoCard.style.border = 'solid 2px rgba(46, 56, 203, 0.8)';
//   currentInfoCard.classList.add('active');
//   // currentInfoCard.style.backgroundColor = 'rgba(7, 0, 255, 0.03)';
// };

// const initMapbox = () => {
//   const mapElement        = document.getElementById('map');
//   const locationInfoCards = document.querySelectorAll('.location-info-card');

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       // style: 'mapbox://styles/mapbox/dark-v10',
//       style: 'mapbox://styles/ethyls/ck98kn09i189y1io6xd8w2r5e',
//       zoom: 8,
//       center: [mapElement.dataset.longitude, mapElement.dataset.latitude],
//       offset: -100
//     });

//     addZoomOnClusters(map, locationInfoCards);

//     const markers = JSON.parse(mapElement.dataset.markers);

//     map.on('load', () => {
//       map.addSource('users', {
//         type: 'geojson',
//         data: { features: markers },
//         cluster: true,
//         clusterMaxZoom: 8, // Max zoom to cluster points on
//         clusterRadius: 100
//       })

//       map.addLayer({
//         id: 'clusters',
//         type: 'circle',
//         source: 'users',
//         filter: ['has', 'point_count'],
//         paint: {
//           // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
//           // with three steps to implement three types of circles:
//           //   * Blue, 20px circles when point count is less than 100
//           //   * Yellow, 30px circles when point count is between 100 and 750
//           //   * Pink, 40px circles when point count is greater than or equal to 750
//           'circle-color': [
//             'step',
//             ['get', 'point_count'],
//             'rgba(241, 134, 104, 0.7)', // couleur petit point
//             100, // jusqu'à ce nombre de point
//             'rgba(241, 134, 104, 0.9)', // couleur gros point
//             200,
//             'rgba(241, 134, 104, 1)' // couleur mega gros point qu'on n'a pas encore
//           ],
//           'circle-radius': [
//             'step',
//             ['get', 'point_count'],
//             20,  // px
//             40,  // jusqu'à ce nombre de point
//             30,  // px
//             100, // jusqu'à ce nombre de point
//             40   // px pour au delà
//           ]
//         }
//       });

//       map.addLayer({
//         id: 'unclustered-point',
//         type: 'circle',
//         source: 'users',
//         filter: ['!', ['has', 'point_count']],
//         paint: {
//           'circle-color': '#2E38CB',
//           'circle-radius': 15,
//           'circle-stroke-width': 1,
//           'circle-stroke-color': '#fff'
//         }
//       });

//       map.addLayer({
//         id: 'unclustered-point-count',
//         type: 'symbol',
//         source: 'users',
//         filter: ['!', ['has', 'point_count']],
//         paint: {
//           'text-color': '#fff'
//         },
//         layout: {
//           'text-field': '{userCount}',
//           'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
//           'text-size': 12,
//         }
//       });

//       map.addLayer({
//         id: 'cluster-count',
//         type: 'symbol',
//         source: 'users',
//         filter: ['has', 'point_count'],
//         layout: {
//           'text-field': '{point_count_abbreviated}',
//           'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
//           'text-size': 12
//         }
//       });

//       map.on('click', 'clusters', function(e) {
//         const features = map.queryRenderedFeatures(e.point, {
//           layers: ['clusters']
//         });
//         const clusterId = features[0].properties.cluster_id;
//         map.getSource('users').getClusterExpansionZoom(
//           clusterId,
//           function(err, zoom) {
//           if (err) return;

//           map.easeTo({
//             center: features[0].geometry.coordinates,
//             zoom: zoom
//           });
//         });
//       });

//       map.on('click', 'unclustered-point', function(e) {
//         const coordinates = e.features[0].geometry.coordinates.slice();
//         const userCount   = e.features[0].properties.userCount;
//         const location    = e.features[0].properties.location;

//         highlightInfoCard(location, locationInfoCards);

//         const text = `La ville de <b><strong>${location}</strong></b> compte <strong>${userCount}</strong> spectateurs potentiels.`
//         new mapboxgl.Popup()
//           .setLngLat(coordinates)
//           .setHTML(` <p>${text}</p><a href="my_concerts/new?address=${location}">Créer un concert !</a>`)
//           .addTo(map)
//           .setWidth(500);
//       });
//     });
//   }
// };

// export { initMapbox };



