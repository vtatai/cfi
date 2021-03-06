class Course < ActiveRecord::Base
  has_and_belongs_to_many :students
  
  validates_presence_of :name
  
  def eligible_students
    Student.all - students
  end
  
  def add_student(student)
    students << student unless students.include?(student)
  end
  
  def remove_student(student)
    students.delete(student)
  end
end
