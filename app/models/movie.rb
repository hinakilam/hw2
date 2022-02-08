class Movie < ApplicationRecord
    has_many :roles,
        foreign_key: :movie_id,
        class_name: :Role

    has_one :person,
        foreign_key: :person_id,
        class_name: :Person
end
