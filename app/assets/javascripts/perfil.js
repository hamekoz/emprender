$('#perfil_recibe_o_recibio_algun_plan_social_false').click( function() {
  $('.plan_social').addClass('hidden').hide().fadeOut();
});

$('#perfil_recibe_o_recibio_algun_plan_social_true').click( function() {
  $('.plan_social').removeClass('hidden').show().fadeIn();
});

$('#perfil_es_unico_ingreso_true').click( function() {
  $('.explicacion_de_ingresos').addClass('hidden').hide().fadeOut();
});

$('#perfil_es_unico_ingreso_false').click( function() {
  $('.explicacion_de_ingresos').removeClass('hidden').show().fadeIn();
});

