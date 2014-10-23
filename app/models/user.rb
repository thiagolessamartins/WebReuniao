class User < ActiveRecord::Base
  belongs_to :pessoa
  has_many :questaos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  Role=%w[coordenador]
    def role_symbols
        [role.to_sym]
    end
    
    def role?(role)
        role.include?(role.to_s)
    end
end
