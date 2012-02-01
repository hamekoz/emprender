class CreateEmprendedores < ActiveRecord::Migration
  def change
    create_table :emprendedores do |t|
      t.references :usuario
      t.string :domicilio
      t.references :barrio
      t.string :telefono_fijo
      t.string :telefono_celular
      t.string :telefono_para_mensajes
      t.string :observaciones_de_telefonos
      t.references :estudio
      t.string :cantidad_de_hijos
      t.string :plan_social
      t.date :vigencia_desde
      t.date :vigencia_hasta
      t.string :actividad_laboral_extra
      t.string :relacion_de_dependecia
      t.string :relacion_con_el_sector_del_emprendimiento
      t.string :cantidad_de_horas_laborales
      t.string :es_unico_ingreso

      t.timestamps
    end
    add_index :emprendedores, :usuario_id
  end
end
