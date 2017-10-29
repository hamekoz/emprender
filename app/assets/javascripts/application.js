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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require social-share-button
// require twitter/bootstrap
//= require chosen-jquery
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/es-AR
//= require bootstrap
//= require emprendimientos
//= require perfil
// require raphael/raphael
// require g.raphael/g.raphael
// require g.raphael/g.pie
//= require reportes

/*
 * Fuciones generales de Emprender
 */

$("a[rel=popover]").popover();
$(".tooltip").tooltip();
$("a[rel=tooltip]").tooltip();
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
  delay: { show: 2000, hide: 100 }
});