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