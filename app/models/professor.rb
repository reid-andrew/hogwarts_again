class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates_presence_of :name, :age, :specialty

  def average_student_age
    total_age = students.sum { |student| student.age}
    total_age / students.length
  end

  def sorted_students
    students.order(:name)
  end
end
