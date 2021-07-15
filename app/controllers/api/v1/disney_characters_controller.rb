# frozen_string_literal: true

module Api
  module V1
    class DisneyCharactersController < ApplicationController
      def index
        
        render json: disney_characters, each_serializer: DisneyCharacterSerializer, status: :ok
      end

      def show
        disney_character

        render json: disney_character, serializer: ShowDisneyCharacterSerializer::DisneyCharacterSerializer,
               status: :ok
      end

      def update
      
      end

      def create
        create_disney_character = DisneyCharacter.new(creation_disney_character_params)
        create_disney_character.movie = movie
        if create_disney_character.save       
         

          render json: create_disney_character, serializer: DisneyCharacterSerializer, status: :created
        else
          render json:{"No se pudo guardar"},status: :unprocessable_entity
        end

        
      end

      def destroy
        
      end

      private

      def disney_characters
        @disney_characters ||= fetch_disney_characters

      end  
      def fetch_disney_characters
        characters = DisneyCharacter.all
        characters = characters.for_name(name) if name
        characters = characters.for_age(age) if age
        characters
      end  

      def name
        params(:name)
      end
      def age
        params(:age)
      end

      def disney_character
        @disney_character ||= DisneyCharacter.find(params[:id])
      end

      def creation_disney_character_params
        params.permit(
          :name,
          :age,
          :weight,
          :history
        )
      end

      def movie
        @movie ||= Movie.find_by(name:"Toy Story 2")
      end
    end
  end
end
