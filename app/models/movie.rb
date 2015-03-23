class Movie < ActiveRecord::Base

   LANGUAGE = ['kannada', 'tamil', 'telagu', 'hindi', 'malyalam', 'english', 'others']
   RATING = ['excelent', 'good', 'poor', 'worst']

   belongs_to :user

   validates_presence_of :name
   validates_presence_of :language
   validates_presence_of :rating
end
