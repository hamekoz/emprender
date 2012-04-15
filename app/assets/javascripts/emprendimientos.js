$(function() {
  $('.datepicker').datepicker({
                     changeMonth: true,
                     changeYear: true, 
                     showOtherMonths: true,
                     selectOtherMonths: true,
                     showOn: "both",
                     buttonImage: "calendar.png",
                     dateFormat: "DD, d MM, yy"
  });
});

$('#emprendimiento_emprendedor_attributes_recibe_o_recibio_algun_plan_social_false').click( function() {
  $('.plan_social').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_emprendedor_attributes_recibe_o_recibio_algun_plan_social_true').click( function() {
  $('.plan_social').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_emprendedor_attributes_es_unico_ingreso_true').click( function() {
  $('.explicacion_de_ingresos').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_emprendedor_attributes_es_unico_ingreso_false').click( function() {
  $('.explicacion_de_ingresos').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_competencia_en_mismo_barrio_false').click( function() {
  $('.descripcion_de_competencia_en_mismo_barrio').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_competencia_en_mismo_barrio_true').click( function() {
  $('.descripcion_de_competencia_en_mismo_barrio').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_inscripto_en_ingresos_brutos_false').click( function() {
  $('.fecha_de_inscripcion_ingresos_brutos').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_inscripto_en_ingresos_brutos_true').click( function() {
  $('.fecha_de_inscripcion_ingresos_brutos').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_recibe_ayuda_de_programas_sociales_false').click( function() {
  $('.programas_sociales').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_recibe_ayuda_de_programas_sociales_true').click( function() {
  $('.programas_sociales').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_vinculado_a_sociedad_civil_true').click( function() {
  $('.vinculado_a_sociedad_civil').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_vinculado_a_sociedad_civil_false').click( function() {
  $('.vinculado_a_sociedad_civil').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_recibio_ayuda_de_la_sociedad_civil_true').click( function() {
  $('.recibio_ayuda_de_la_sociedad_civil').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_recibio_ayuda_de_la_sociedad_civil_false').click( function() {
  $('.recibio_ayuda_de_la_sociedad_civil').removeClass('hidden').show().fadeIn();
});

$('#emprendimiento_dispone_de_espacio_fisico_para_produccion_false').click( function() {
  $('.dispone_de_espacio').addClass('hidden').hide().fadeOut();
  $('.no_dispone_de_espacio').removeClass('hidden').show().fadeIn();
  $('.es_en_vivienda_particular').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_dispone_de_espacio_fisico_para_produccion_true').click( function() {
  $('.dispone_de_espacio').removeClass('hidden').show().fadeIn();
  $('.no_dispone_de_espacio').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_es_en_vivienda_particular_false').click( function() {
  $('.es_en_vivienda_particular').addClass('hidden').hide().fadeOut();
});

$('#emprendimiento_es_en_vivienda_particular_true').click( function() {
  $('.es_en_vivienda_particular').removeClass('hidden').show().fadeIn();
});
