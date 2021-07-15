
module Api
  module V1
    module ShowDisneyCharacterSerializer
      Class DisneyCharacterSerializer < ApplicationSerializer
                 atributes :id,
                           :image,
                           :name,
                           :weight,
                           :history

                  has_one :movie, serializer: MovieSerializer         
      end
    end
  end
end