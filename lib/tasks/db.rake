namespace :db do
    desc "Populate local/staging data for testing purpose"
      task populate: :environment do

        disney_character_names = [
          "Rapunzel",
          "Flynn Rider",
          "Simba",
          "Mufasa",
          "Wall-E",
          "EVA",
          "Woody",
          "Buzz Lightyear"
        ]

        # Genres
        animation_genre = Genre.create!(
            image: "image",
            name: "Animation"
        )
        adventure_genre = Genre.create!(
          image: "image",
          name: "Adventure"
        )
        comedy_genre = Genre.create!(
          image: "image",
          name: "Comedy"
        )
        drama_genre = Genre.create!(
          image: "image",
          name: "Drama"
        )
        family_genre = Genre.create!(
          image: "image",
          name: "Family"
        )

        # Movies
        tangled = Movie.create!(
          genre: animation_genre, adventure_genre, comedy_genre,
          image: "image",
          title: "Tangled",
          date_of_creation: 2011/01/06,
          qualification: 3,
        )
        lion_king= Movie.create!(
          genre: animation_genre, adventure_genre, drama_genre,
          image: "image",
          title: "The Lion King",
          date_of_creation: 1994/07/07 ,
          qualification: 5,
        )
        wall_e= Movie.create!(
          genre: animation_genre, adventure_genre, family_genre,
          image: "image",
          title: "Wall-E",
          date_of_creation: 2008/07/09,
          qualification: 4,
        )
        toy_story= Movie.create!(
          genre: animation_genre, adventure_genre, comedy_genre,
          image: "image",
          title: "Toy Story",
          date_of_creation: 1996/03/14,
          qualification: 4,
        )

        def get_movie_for(name)
          case name
          when "Rapunzel"
            Movie.find_by(title: "Tangled")
          when "Flynn Rider"
            Movie.find_by(title: "Tangled")
          when "Simba"
            Movie.find_by(title: "The Lion King")
          when "Mufasa"
            Movie.find_by(title: "The Lion King")
          when "Wall-E"
            Movie.find_by(title: "Wall-E")
          when "EVA"
            Movie.find_by(title: "Wall-E")
          when "Woody"
            Movie.find_by(title: "Toy Story")
          when "Buzz Lightyear"
            Movie.find_by(title: "Toy Story")
        end

        def age_for(name)
          case name
          when "Rapunzel"
            "18"
          when "Flynn Rider"
            "25"
          when "Simba"
            "5"
          when "Mufasa"
            "20"
          when "Wall-E"
            "150"
          when "EVA"
            "5"
          when "Woody"
            "10"
          when "Buzz Lightyear"
            "2"
        end

        # Disney characters
        disney_character_names.count.times do |i|
          name = disney_character_names[i]
          age = age_for(name)
          movie = get_movie_for(name)

          DisneyCharacter.create!(
            movie: movie,
            age: age,
            name: name,
            image: "image",
            weight: 40.0,
            history: "History"
          )
        end
    end
  end