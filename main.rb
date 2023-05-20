require_relative './classes/app'

def menu
  "
Please choose an option by entering a number
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit
  ->"
end

def new_person(app)
  print ' Select (1) for teacher (2) for student -> '
  psel = gets.chomp.to_i
  if psel == 1
    print "  New Teacher's age: "
    age = gets.chomp.to_i
    print ' Specialization: '
    specialization = gets.chomp
    print ' Name: '
    name = gets.chomp
    app.create_teacher(age, specialization, name)
  elsif psel == 2
    puts '  selected'
    print " New Studdent's Age: "
    age = gets.chomp.to_i
    print ' Name: '
    name = gets.chomp
    print ' Parent permission: (y/n) '
    permission = gets.chomp.capitalize == 'Y'
    app.create_student(age, name, parent_permission: permission)
  end
end

def new_rental(app)
  puts 'Select a book:'
  app.list_books_index
  sel_book = gets.chomp.to_i
  puts 'Select a person:'
  app.list_people_index
  sel_pers = gets.chomp.to_i
  app.create_rental app.books[sel_book], app.people[sel_pers]
end

def list_rental_id(app)
  puts 'Search books rented by person'
  app.list_people_index
  print 'Select person ID:'
  sel_id = gets.chomp.to_i
  idx = app.people.index { |e| e.id == sel_id }
  app.list_rental app.people[idx]
end

def new_book(app)
  puts ' New Book'
  print ' Title: '
  title = gets.chomp
  print ' Author: '
  author = gets.chomp
  app.create_book title, author
end

def check_menu(app)
  case sel
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    new_person app
  when 4
    new_book app
  when 5
    new_rental app
  when 6
    list_rental_id app
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App'
  loop do
    print menu
    sel = gets.chomp.to_i
    break if sel == 7

    check_menu app
  end
end

main
