# frozen_string_literal: true

module Api
    module V1
      class GenresController < ApplicationController
        def index
          genres_1 = Genre.all

          render json: genres,status: :ok
        end
  
        def show
          genre
  
          render json: genre,status: :ok
        end
  
        def update
        
        end
  
        def create
          create_genre = Genre.new(creation_genre_params)
          create_genre.movie = movie
          if create_genre.save       
           
  
            render json: create_genre, serializer: GenreSerializer, status: :created
          else
            render json:{"No se pudo guardar"},status: :unprocessable_entity
          end
  
          
        end
  
        def destroy
            
        end
  
        private
  
        def genres
          @genres ||= fetch_genres
  
        end  
        
  
        def genre
          @genre ||= Genre.find(params[:id])
        end
  
        def creation_genre_params
          params.permit(
            :name,
            
          )
        end
  
        
      end
    end
  end
  