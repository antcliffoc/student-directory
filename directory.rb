@students = []

def input_students
  puts 'Please enter the names of the students to add'
  puts "to finish, just hit return twice"
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} evil student"
  else
    puts "Overall, we have #{@students.count} evil students."
  end
end

def show_students
  print_header()
  print_students_list()
  print_footer()
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students()
    when "2"
      show_students()
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    # 1. print the menus and ask user response
    print_menu()
    # 3. do what the user has asked
    process(gets.chomp)
  end
end
#call the methods

interactive_menu()
