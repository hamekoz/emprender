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
  delay: { show: 750, hide: 100 }
});
