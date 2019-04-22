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
//= require infinite-scroll.pkgd.min.js
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  // jqvmap
    var dX,dY,dS;
    $('#vmap').vectorMap({
        map: 'world_en',
        backgroundColor: '#ffffff',
        borderColor: '#ffffff',
        borderOpacity: 0.25,
        borderwidth: 1,
        color: '#81C7D4',
        hoverOpacity: 0.7,
        enableZoom: true,
        hoverOpacity: null,
        normalizeFunction: 'polynomial',
        scaleColors: ['#986DB2', '#7B90D2'],
        hoverColor: '#1E88A8',
        selectedColor: '#1E88A8',
        selectedRegions: null,
        showTooltip: true,
        values: sample_data,
        onRegionClick: function(element, code, region) {
          console.log(element);
          console.log(code); //Country code will be passed to the callback as argument
          console.log(region);
          var message = 'You clicked "'
          + region
          + '" which has the code: '
          + code
          alert(message);
        }
    });

    // preview
    $('form').on('change', 'input[type="file"]', function(e){
      var file = e.target.files[0],
          reader = new FileReader(),
          $preview = $(".preview");

      reader.onload = (function(file){
          return function(e){
            $preview.empty();
            $preview.append($('<img>').attr({
              src: e.target.result,
              width: "200px",
              class: "preview"
            }));
          };
      })(file);
      reader.readAsDataURL(file);
    });

    // infinite scroll
    $('#posts').infiniteScroll({
        path: '.pagination a[rel=next]',
        append: ".post",
        history: 'push',
        prefill: true,
        status: '.page-load-status'
    });


});