if Meteor.isClient
	Meteor.startup ->
    GoogleMaps.load()
    return

Template.map.helpers
  mapOptions: ->
    if GoogleMaps.loaded()
      return {
        center: new (google.maps.LatLng)(45.509008, -73.551446)
        zoom: 15
      }
    return

Template.map.onCreated ->
  GoogleMaps.ready 'map', (map) ->
    marker = new (google.maps.Marker)(position: map.options.center, map: map.instance)
    return
  return
