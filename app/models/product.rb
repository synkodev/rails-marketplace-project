class Product < ApplicationRecord
  belongs_to  :user
  has_many    :carts
  
  CATEGORIES = %w[Acessórios
                  Agricultura
                  Animais\ domésticos
                  Alimentação
                  Antiguidades
                  Arte\ e\ Papelaria
                  Beleza\ e\ Bem-estar
                  Brinquedos
                  Calçados
                  Roupas
                  Bolsas\ e\ Mochilas
                  Ilícitos
                  Câmeras
                  Celulares
                  Computadores
                  Periféricos
                  Gamer
                  Casa
                  Cama\ Mesa\ e\ Banho
                  Móveis
                  Esportes
                  Ferramentas
                  Festa
                  Imóveis
                  Jóias
                  Saúde
                  Serviços
                  Adulto
                  Criptomoeda
                  Proibido\ em\ 78\ países
                  Outros].sort.to_set.freeze

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :user, presence: true
  validate  :user_exists?

  private

  def user_exists?
    errors.add(:user, 'does not exist in the database') if user.present? && user.new_record?
  end
end
