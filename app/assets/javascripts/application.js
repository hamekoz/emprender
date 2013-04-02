// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require social-share-button
//= require twitter/bootstrap
//= require chosen-jquery
//= require raphael/raphael
//= require g.raphael/g.raphael
//= require g.raphael/g.pie
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/es-AR
//= require_tree .
//= require_self

$('span').tooltip();

$('.textarea').wysihtml5({ "locale": "es-AR", image: false });

$(".chzn-select").chosen();

$('.autor').popover({
  trigger: 'hover'
});

$('#logo').popover({
  trigger: 'hover',
  title: 'Autores',
  html: true,
  content: '<p><em>Ingenieros Informáticos:</p></em><p>- Claudio Rodrigo Pereyra Diaz</p><p>- Adriel Hernán Caramichos</p>',
  placement: 'bottom',
  delay: { show: 750, hide: 100 }
});
