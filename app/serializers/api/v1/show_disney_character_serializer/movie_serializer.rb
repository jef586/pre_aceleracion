module Api
  module V1
    module ShowMovieSerializer
      Class MovieSerializer < ApplicationSerializer
                  atributes :id,
                            :image,
                            :title,
                            :date_of_creation,
                            :qualification
  
                  has_many :disney_characters, serializer: DisneyCharacterSerializer         
      end
    end
  end
end