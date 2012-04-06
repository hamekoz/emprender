class CreateEmprendedores < ActiveRecord::Migration
  def change
    create_table :emprendedores do |t|
      t.references :usuario
      t.string :dni
      t.string :cuit_cuil
      t.string :domicilio
      t.references :barrio
      t.string :telefono_particular
      t.string :telefono_celular
      t.string :telefono_para_mensajes
      t.text :observaciones_de_telefonos
      t.string :nivel_de_estudios
      t.boolean :estudios_completos
      t.string :titulo
      t.boolean :recibe_o_recibio_algun_plan_social
      t.string :plan_social
      t.date :fecha_de_recepcion #del plan social
      t.string :actividad_laboral_principal
      t.string :relacion_laboral
      t.integer :cantidad_de_horas_semanales
      t.boolean :es_unico_ingreso
      t.text :explicacion_de_ingresos

      t.timestamps
    end
    add_index :emprendedores, :usuario_id
  end
end
