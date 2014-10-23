class Atum < ActiveRecord::Base
  has_one  :reuniao
  has_attached_file :documento, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment :documento, content_type: { content_type: "application/pdf" }
 def self.search(query)

   if query.present? 

           where(["id = :query", query: query])
   end
  end

end
