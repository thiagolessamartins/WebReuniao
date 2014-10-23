class SugestaoItemPautum < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :reuniao
  belongs_to :questao
  #validates_presence_of :motivoReprovar, :aprovar => { :equal_to => "não" }
                #validates_presence_of :motivoReprovar, :if => .update{|f| f.aprovar =="não" } 
 validates_presence_of :motivoSugestao ,:questao,:message => "não pode ficar em branco"


 Aprovar = %w[sim não]
end
