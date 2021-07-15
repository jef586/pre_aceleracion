# frozen_string_literal: true

module Api
    module V1
      class MoviesController < ApplicationController
        def index
          
          render json: movies, each_serializer: MovieSerializer, status: :ok
        end
  
        def show
          movie 
  
          render json: movie, serializer: ShowMovieSerializer::MovieSerializer,
                 status: :ok
        end
  
        def update
        
        end
  
        def create
          create_movie = Movie.new(creation_movie_params)
          create_movie.disneycharacter = disneycharacter
          if create_movie.save       
           
  
            render json: create_movie, serializer: MovieSerializer, status: :created
          else
            render json:{"No se pudo guardar"},status: :unprocessable_entity
          end
  
          
        end
  
        def destroy
        
        end
  
        private
  
        def movies
          @movies ||= fetch_movies
  
        end  
        def fetch_movies
          movies_1 = Movie.all
          movies_1 = movies_1.for_title(title) if title
          movies_1 = movies_1.for_creation_date(date_of_creation) if date_of_creation
          movies_1
        end  
  
        def title
          params(:title)
        end
        def date_of_creation
          params(:date_of_creation)
        end
  
        def movie
          @movie ||= Movie.find(params[:id])
        end
  
        def creation_movie_params
          params.permit(
            :title,
            :date_of_creation,
            :qualification
            
          )
        end
        
      end
    end
  end
  