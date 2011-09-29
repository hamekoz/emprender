# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("table#3columnas").tablesorter({
  headers: { 2: { sorter: false } }
});

$("table#4columnas").tablesorter({
  headers: { 3: { sorter: false } }
});

$("table#5columnas").tablesorter({
  headers: { 4: { sorter: false } }
});
