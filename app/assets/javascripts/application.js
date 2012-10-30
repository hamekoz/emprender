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
//= require bootstrap
//= require jquery-ui
//= require chosen-jquery
//= require raphael-min
//= require g.raphael-min
//= require g.pie-min
//= require_tree .

$('a').tooltip();
$('span').tooltip();

$(".chzn-select").chosen();

$('#logo').popover({
  trigger: 'hover',
  title: 'Autores',
  html: true,
  content: '<ul><li>Claudio Rodrigo Pereyra Diaz</li><li>Adriel Hernán Caramichos</li><li>Universidad Fasta</li></ul>',
  placement: 'bottom',
  delay: { show: 750, hide: 100 }
});
