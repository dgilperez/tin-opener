require 'spec_helper'
require File.expand_path('../../../../lib/tin_opener/data_file_processor', __FILE__)

module TinOpener
  RSpec.describe DataFileProcessor do
    let(:data_file_processor) { TinOpener::DataFileProcessor.new(file: data_file) }

    context "CSV processing" do
      let(:data_file) { File.open(File.join('spec', 'fixtures', 'data_sets', 'bici_disponibilidad.csv'), 'r') }

      it "extracts the headers format from the first row" do
        expected_headers = {
          dia: "String",
          horas_totales_usos_bicicletas: "String",
          horas_totales_disponibilidad_bicicletas_en__anclajes: "String",
          total_horas_servicio_bicicletas: "String",
          media_bicicletas_disponibles: "String",
          usos_abonado_anual: "String",
          usos_abonado_ocasional: "String",
          total_usos: "String"
        }
        expect(data_file_processor.headers).to eq expected_headers
      end

      it "converts all the rows to an array of hashes with snake-cased keys" do
        expected_last_row = {
          dia: "18/10/2015",
          horas_totales_usos_bicicletas: "3.372,28",
          horas_totales_disponibilidad_bicicletas_en__anclajes: "35.124,73",
          total_horas_servicio_bicicletas: "38.497,01",
          media_bicicletas_disponibles: "1.604,04",
          usos_abonado_anual: "5.999",
          usos_abonado_ocasional: "232",
          total_usos: "6.231"
        }
        expect(data_file_processor.rows.size).to eq(70)
        expect(data_file_processor.rows.last).to eq(expected_last_row)
      end
    end
  end
end
