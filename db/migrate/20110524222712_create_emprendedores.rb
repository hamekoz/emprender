class CreateEmprendedores < ActiveRecord::Migration
  def self.up
    create_table :emprendedores do |t|
      t.references :usuario
      t.references :tipoDocumento
      t.string :nro_documento
      t.references :domicilio
      t.references :nivelEstudio
      t.boolean :estudio_completo
      t.integer :hijos
      t.references :planSocial
      t.datetime :fecha_desde_plan_social
      t.datetime :fecha_hasta_plan_social
      t.boolean :actividad_labotal_adicional
      t.boolean :actividad_labotal_adicional_independiente
      t.boolean :actividad_labotal_adicional_relacionada_al_emprendimiento
      t.integer :actividad_labotal_adicional_horas_semanales
      t.boolean :actividad_labotal_adicional_unico_ingreso
      t.references :emprendimiento

      t.timestamps
    end
  end

  def self.down
    drop_table :emprendedores
  end
end
