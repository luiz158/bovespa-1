require 'rubygems'
require 'bovespa'
require 'rspec'
class MyClass < Bovespa::Historico
end

describe MyClass do
  context "given a position file" do
    before do
      @historico = MyClass.new("DemoCotacoesHistoricas12022003.txt")
    end

	  it "should give information about the header" do
		  @historico.nome_do_arquivo.should eq("COTAHIST.2003")
		  @historico.codigo_de_origem.should eq("BOVESPA")
		  @historico.data_de_geracao_do_arquivo.should eq("20040531")
	  end

	  it "should get the code of the asset" do 
		  @historico.vale5["codneg"].should eq("VALE5")
	  end

	  it "should return a list of every asset turned into attribute" do	
		  @historico.pos_attributes.length.should be > 478
	  end
  end

	it "should have valid specified fields" do
		MyClass.valid_specification?.should be true
	end
end
