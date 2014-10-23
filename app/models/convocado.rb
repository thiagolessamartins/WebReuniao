class Convocado < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :reuniao
  Presenca = %w[Sim Não]
 def self.search(query1,query2)



     #where(['pessoa_id =:query1 AND reuniao_id = :query2', query1:"%#{query1}%", query2:"%#{query2}%"])
      where(['pessoa_id = :query1 AND reuniao_id = :query2',query1: query1, query2: query2])
           #where(["pessoa_id = :query", query1: query1])
     #where(["pessoa_id = :query1 AND reuniao_id = :query2",query1,query2])
   
  end


end
