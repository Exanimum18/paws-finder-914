import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    // markers: Array
    marker: Object
  }

  connect() {


    // mapboxgl.accessToken = this.apiKeyValue
    // this.map = new mapboxgl.Map({
    //   container: this.element,
    //   style: "mapbox://styles/mapbox/streets-v11",
    //   zoom: 18
    // });

    mapboxgl.accessToken = 'pk.eyJ1IjoibWljaGFlbGVjNTE5IiwiYSI6ImNsNnk3NGd1NjAzdmgzYmt6YnZ3cmo2eWUifQ.Sr5rvPX04CS6SaK5NwOuHQ';
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
      center: [this.markerValue.lng, this.markerValue.lat], // starting position [lng, lat]
      zoom: 18, // starting zoom
    });

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #fitMapToMarkers() {
    // console_log(market.lng, market.lat);
    const bounds = new mapboxgl.LngLatBounds()
    // this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
  #addMarkersToMap() {
    // this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${this.markerValue.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "30px"
      customMarker.style.height = "30px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup)
        .addTo(this.map)
    // });
    // new mapboxgl.Marker()
    // .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
  }  // .addTo(this.map)
}
