class Reuniao < ActiveRecord::Base
  belongs_to :local
  belongs_to :pautum
  belongs_to :atum
  belongs_to :category
  has_many :convocados
  has_many :participacaos
  has_many :sugestao_item_pautums
  
  Status =%w[cancelada aprovada Preparação]
  validates_presence_of :titulo,:category
  scope :created_between, lambda {|start_date, end_date| where("data >= ? AND data <= ?", start_date, end_date )}

  scope :buscarAta, lambda {|ata| where("atum_id == ? ", ata )}


  def self.buscaTitulo(query)

   if query.present? 
      where(['titulo LIKE :query OR data LIKE :query', query:"%#{query}%"])
   else
      where(['data LIKE ""', query:"%#{""}%"])
   end
  end


end
