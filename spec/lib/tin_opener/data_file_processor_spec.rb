require 'rails_helper'

module TinOpener
  RSpec.describe DataFileProcessor do
    let(:data_file_processor) { TinOpener::DataFileProcessor.new(file: data_file) }

    context "CSV" do
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

    context "XLS" do
      let(:data_file) { File.open(File.join('spec', 'fixtures', 'data_sets', 'encuesta-calidad-de-vida-2014.xls'), 'r') }
      let(:expected_headers) {
        {:nuncuesti=>"String", :p0=>"String", :p1=>"String", :p2_a=>"String", :p2_b=>"String", :p3_a=>"String", :p3_b=>"String", :p3_c=>"String", :p3_d=>"String", :p3_e=>"String", :p3_f=>"String", :p3_g=>"String", :p3_h=>"String", :p3_i=>"String", :p3_j=>"String", :p3_k=>"String", :p3_l=>"String", :p3_m=>"String", :p4_a=>"String", :p4_b=>"String", :p5=>"String", :p6_alit=>"String", :p6_a=>"String", :p6_blit=>"String", :p6_b=>"String", :p6_clit=>"String", :p6_c=>"String", :p7_alit=>"String", :p7_a=>"String", :p7_blit=>"String", :p7_b=>"String", :p7_clit=>"String", :p7_c=>"String", :p81=>"String", :p82=>"String", :p83=>"String", :p84=>"String", :p85=>"String", :p86=>"String", :p87=>"String", :p88=>"String", :p89=>"String", :p810=>"String", :p811=>"String", :p812=>"String", :p813=>"String", :p814=>"String", :p815=>"String", :p816=>"String", :p817=>"String", :p818=>"String", :p819=>"String", :p820=>"String", :p911=>"String", :p912=>"String", :p913=>"String", :p921=>"String", :p922=>"String", :p923=>"String", :p931=>"String", :p932=>"String", :p933=>"String", :p941=>"String", :p942=>"String", :p943=>"String", :p951=>"String", :p952=>"String", :p953=>"String", :p961=>"String", :p962=>"String", :p963=>"String", :p971=>"String", :p972=>"String", :p973=>"String", :p981=>"String", :p982=>"String", :p983=>"String", :p991=>"String", :p992=>"String", :p993=>"String", :p9101=>"String", :p9102=>"String", :p9103=>"String", :p9111=>"String", :p9112=>"String", :p9113=>"String", :p9121=>"String", :p9122=>"String", :p9123=>"String", :p9131=>"String", :p9132=>"String", :p9133=>"String", :p9141=>"String", :p9142=>"String", :p9143=>"String", :p9151=>"String", :p9152=>"String", :p9153=>"String", :p9161=>"String", :p9162=>"String", :p9163=>"String", :p9171=>"String", :p9172=>"String", :p9173=>"String", :p9181=>"String", :p9182=>"String", :p9183=>"String", :p9191=>"String", :p9192=>"String", :p9193=>"String", :p9201=>"String", :p9202=>"String", :p9203=>"String", :p9211=>"String", :p9212=>"String", :p9213=>"String", :p9221=>"String", :p9222=>"String", :p9223=>"String", :p9231=>"String", :p9232=>"String", :p9233=>"String", :p9241=>"String", :p9242=>"String", :p9243=>"String", :p9251=>"String", :p9252=>"String", :p9253=>"String", :p101=>"String", :p102=>"String", :p103=>"String", :p104=>"String", :p105=>"String", :p106=>"String", :p107=>"String", :p108=>"String", :p109=>"String", :p1010=>"String", :p1011=>"String", :p1012=>"String", :p1013=>"String", :p111=>"String", :p112=>"String", :p113=>"String", :p114=>"String", :p115=>"String", :p116=>"String", :p117=>"String", :p118=>"String", :p119=>"String", :p1110=>"String", :p12=>"String", :p131=>"String", :p132=>"String", :p141=>"String", :p142=>"String", :p151=>"String", :p152=>"String", :p161=>"String", :p162=>"String", :p163=>"String", :p164=>"String", :p165=>"String", :p166=>"String", :p167=>"String", :p168=>"String", :p169=>"String", :p1610=>"String", :p1611=>"String", :p1612=>"String", :p1613=>"String", :p1614=>"String", :p1615=>"String", :p1616=>"String", :p1617=>"String", :p17=>"String", :p18=>"String", :p191=>"String", :p192=>"String", :p193=>"String", :p194=>"String", :p195=>"String", :p196=>"String", :p197=>"String", :p198=>"String", :p199=>"String", :p1910=>"String", :p1911=>"String", :p1912=>"String", :p201=>"String", :p202=>"String", :p203=>"String", :p204=>"String", :p2111=>"String", :p2112=>"String", :p2121=>"String", :p2122=>"String", :p2131=>"String", :p2132=>"String", :p2141=>"String", :p2142=>"String", :p22=>"String", :p23=>"String", :p24=>"String", :p251=>"String", :p252=>"String", :p253=>"String", :p254=>"String", :p255=>"String", :p256=>"String", :p26=>"String", :p27=>"String", :p281=>"String", :p282=>"String", :p283=>"String", :p284=>"String", :p285=>"String", :p286=>"String", :p287=>"String", :p288=>"String", :p289=>"String", :p2810=>"String", :p2811=>"String", :p2812=>"String", :p2813=>"String", :p29=>"String", :p301=>"String", :p302=>"String", :p31=>"String", :p32_lit=>"String", :p32=>"String", :p33=>"String", :p34=>"String", :p35=>"String", :p361=>"String", :p362=>"String", :p37=>"String", :p38=>"String", :p39=>"String", :p40=>"String", :p41=>"String", :p42=>"String", :p43=>"String", :p44=>"String", :p45=>"String", :p46=>"String", :p47=>"String", :seccion=>"String", :barrio=>"String", :codbarrio=>"String", :distrito=>"String", :ser=>"String", :encuestador=>"String", :ruta=>"String", :peso=>"String"}
      }

      it "extracts the headers format from the first row" do
        expect(data_file_processor.headers).to eq expected_headers
      end

      it "converts all the rows to an array of hashes with snake-cased keys" do
        expected_last_row = {:nuncuesti=>"10614601", :p0=>"1", :p1=>"5", :p2_a=>"4", :p2_b=>"4", :p3_a=>"1", :p3_b=>"2", :p3_c=>"2", :p3_d=>"1", :p3_e=>"1", :p3_f=>"1", :p3_g=>"2", :p3_h=>"3", :p3_i=>"3", :p3_j=>"2", :p3_k=>"2", :p3_l=>"8", :p3_m=>"2", :p4_a=>"3", :p4_b=>"3", :p5=>"2", :p6_alit=>"trabajo", :p6_a=>"901", :p6_blit=>"limpiza de calles", :p6_b=>"617", :p6_clit=>"zonas para ninos parques", :p6_c=>"607", :p7_alit=>"circulacion vias atascos", :p7_a=>"101", :p7_blit=>"economia sueldos", :p7_b=>"1101", :p7_clit=>"nada mas", :p7_c=>nil, :p81=>"8", :p82=>"8", :p83=>"0", :p84=>"0", :p85=>"4", :p86=>"0", :p87=>"6", :p88=>"4", :p89=>"4", :p810=>"4", :p811=>"3", :p812=>"4", :p813=>"0", :p814=>"5", :p815=>"5", :p816=>"6", :p817=>"3", :p818=>"0", :p819=>"3", :p820=>"0", :p911=>"6", :p912=>"2", :p913=>"2", :p921=>"6", :p922=>"2", :p923=>"2", :p931=>"5", :p932=>"2", :p933=>"2", :p941=>"0", :p942=>"2", :p943=>"1", :p951=>"0", :p952=>"1", :p953=>"3", :p961=>"3", :p962=>"2", :p963=>"3", :p971=>"6", :p972=>"1", :p973=>"2", :p981=>"10", :p982=>"2", :p983=>"1", :p991=>"8", :p992=>"1", :p993=>"1", :p9101=>"8", :p9102=>"1", :p9103=>"1", :p9111=>"10", :p9112=>"1", :p9113=>"1", :p9121=>"0", :p9122=>"2", :p9123=>"1", :p9131=>"5", :p9132=>"2", :p9133=>"1", :p9141=>"11", :p9142=>"2", :p9143=>"8", :p9151=>"8", :p9152=>"2", :p9153=>"1", :p9161=>"6", :p9162=>"1", :p9163=>"2", :p9171=>"5", :p9172=>"2", :p9173=>"1", :p9181=>"5", :p9182=>"2", :p9183=>"1", :p9191=>"5", :p9192=>"1", :p9193=>"1", :p9201=>"2", :p9202=>"1", :p9203=>"1", :p9211=>"7", :p9212=>"1", :p9213=>"2", :p9221=>"5", :p9222=>"2", :p9223=>"2", :p9231=>"6", :p9232=>"2", :p9233=>"2", :p9241=>"5", :p9242=>"2", :p9243=>"2", :p9251=>"11", :p9252=>"2", :p9253=>"8", :p101=>nil, :p102=>nil, :p103=>nil, :p104=>nil, :p105=>nil, :p106=>nil, :p107=>"7", :p108=>nil, :p109=>nil, :p1010=>nil, :p1011=>nil, :p1012=>nil, :p1013=>nil, :p111=>"0", :p112=>"4", :p113=>"5", :p114=>"5", :p115=>"0", :p116=>"6", :p117=>"8", :p118=>"5", :p119=>"9", :p1110=>"10", :p12=>"3", :p131=>nil, :p132=>"2", :p141=>"2", :p142=>"1", :p151=>"3", :p152=>"2", :p161=>"9", :p162=>"11", :p163=>"11", :p164=>"8", :p165=>"0", :p166=>"5", :p167=>"0", :p168=>"10", :p169=>"10", :p1610=>"5", :p1611=>"5", :p1612=>"8", :p1613=>"2", :p1614=>"5", :p1615=>"8", :p1616=>"10", :p1617=>"0", :p17=>"2", :p18=>"4", :p191=>"1", :p192=>nil, :p193=>nil, :p194=>"4", :p195=>nil, :p196=>nil, :p197=>nil, :p198=>nil, :p199=>nil, :p1910=>nil, :p1911=>nil, :p1912=>nil, :p201=>"2", :p202=>"2", :p203=>"2", :p204=>"2", :p2111=>"5", :p2112=>"2", :p2121=>"7", :p2122=>"1", :p2131=>"11", :p2132=>"2", :p2141=>"11", :p2142=>"2", :p22=>"2", :p23=>"5", :p24=>"2", :p251=>"2", :p252=>"2", :p253=>"2", :p254=>"1", :p255=>"2", :p256=>"2", :p26=>"3", :p27=>"2", :p281=>"1", :p282=>"1", :p283=>"1", :p284=>"2", :p285=>"1", :p286=>"1", :p287=>"1", :p288=>"1", :p289=>"1", :p2810=>"1", :p2811=>"1", :p2812=>"1", :p2813=>"1", :p29=>"1", :p301=>"46", :p302=>"3", :p31=>"1", :p32_lit=>" ", :p32=>"724", :p33=>"1", :p34=>"1", :p35=>"4", :p361=>nil, :p362=>"3", :p37=>"1", :p38=>"8", :p39=>"1", :p40=>"1", :p41=>"4", :p42=>"1", :p43=>"5", :p44=>"5", :p45=>"1", :p46=>"1", :p47=>"2", :seccion=>"18", :barrio=>"Casco Historico de Vallecas", :codbarrio=>"181", :distrito=>"18", :ser=>"2", :encuestador=>"13", :ruta=>"208", :peso=>"0.756576101784015"}
        expect(data_file_processor.rows.size).to eq(90)
        expect(data_file_processor.rows.last).to eq(expected_last_row)
      end
    end

    context "XLST" do
      skip 'to be implemented'
    end

    context "XML" do
      skip 'to be implemented'
    end
  end
end
