class Pautum < ActiveRecord::Base
  has_many :item_pautums
  has_one  :reuniao
 def self.search(query)

   if query.present? 

           where(["id = :query", query: query])
   end
  end

end
