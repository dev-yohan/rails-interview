class Student < ActiveRecord::Base

  scope :by_movie, ->(movie) { where("lower(favoritemovie) LIKE ?", "#{movie.downcase}%") }

  def name
    all_students = Rails.cache.fetch("students_all_names", expires_in: 60.seconds) do
      Student.pluck(:firstname)
    end
    repeated = all_students.count(self.firstname) > 1 ? true : false
    repeated ?  "#{self.firstname} #{self.lastname[0,1]}." : self.firstname
  end

  def movie
    self.favoritemovie
  end

end
