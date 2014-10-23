class Ponto < ActiveRecord::Base
  belongs_to :questao
  validates_presence_of :titulo
  scope :buscarPonto, lambda {|questao| where("questao_id == ? ", questao )}
end
