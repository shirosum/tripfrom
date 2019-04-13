// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


// jqvmap
$(document).on('turbolinks:load', function() {
$('#vmap').vectorMap({
    map: 'world_en',
    backgroundColor: '#f1f1f1',
    borderColor: 'white',
    borderOpacity: 0.1,
    color: '#ffffff',
    hoverOpacity: 0.7,
    selectedColor: '#800000',
    enableZoom: true,
    showTooltip: true,
    values: sample_data,
    scaleColors: ['#C8EEFF', '#006491'],
    normalizeFunction: 'polynomial',
    onRegionClick: function(element, code, region) {
      alert();
      console.log(element);
      console.log(region);
      console.log(code);
    }
  });
});