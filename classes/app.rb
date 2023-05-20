require_relative './book'
require_relative './capitalize_decorator'
require_relative './classroom'
require_relative './decorator'
require_relative './nameable'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './trimmer_decorator'

# main app class
class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    @empty_room = Classroom.new('empty')
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title} ,   Author: #{book.author}" }
  end

  def list_books_index
    @books.each_index { |i| puts "#{i}) Title: #{@books[i].title},  Author: #{@books[i].author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name} ,  Age: #{person.age} " }
  end

  def list_people_index
    @people.each_index { |i| puts "#{i}) [#{@people[i].class}] Name: #{@people[i].correct_name} ID: #{@people[i].id}" }
  end

  def create_student(age, name = 'Unknown', parent_permission: true)
    @people << Student.new(@empty_room, age, name, parent_permission: parent_permission)
  end

  def create_teacher(age, specialization, name)
    @people << Teacher.new(age, specialization, name)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person)
    person.add_rental(book)
  end

  def list_rental(person)
    puts "Books rented by #{person.correct_name}"
    person.rentals.each do |rental|
      puts "Title: #{rental.book.title} ,  Author: #{rental.book.author} ,  Date: #{rental.date}"
    end
  end
end
