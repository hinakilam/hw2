class Role < ApplicationRecord

    belongs_to :movie,
        foreign_key: :movie_id,
        class_name: :Movie
    
    has_many :people,
        foreign_key: :person_id,
        class_name: :Person

end
