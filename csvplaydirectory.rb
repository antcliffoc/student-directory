require 'csv'
@students = []

@deliniate = Proc.new { puts "-------------"}

def input_students
  puts 'Please enter the names of the students to add'
  puts "to finish, just hit return twice"
  name = STDIN.gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    add_student(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
  end
  @students
end

def add_student(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  @deliniate.call
end

def print_students_list
  count = 1
  @students.each do |student|
    puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)"
    count += 1
  end
end

def print_footer
  @deliniate.call
  if @students.count == 1
    puts "Overall, we have #{@students.count} evil student"
  else
    puts "Overall, we have #{@students.count} evil students."
  end
  @deliniate.call
end

def show_students
  print_header()
  print_students_list()
  print_footer()
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
  @deliniate
end

def process(selection)
  case selection
  when "1"
    input_students()
  when "2"
    show_students()
  when "3"
    save_students()
  when "4"
    load_students()
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end


def save_students(filename = 'students.csv')
  CSV.open(filename, "a") { |line| @students.each { |hash| line << hash.values } }
  puts "students saved"
end

def load_students(filename = 'students.csv')
  student_count = 0
  CSV.foreach(filename) do |row|
    add_student(row[0], row[1])
    student_count += 1
  end
  puts "loaded #{student_count} from #{filename}"
end

def try_load_students
  ARGV.first != nil ? filename = ARGV.first : filename = "students.csv"
  load_students(filename)
end

def interactive_menu
  loop do
    # 1. print the menus and ask user response
    print_menu()
    # 3. do what the user has asked
    process(STDIN.gets.chomp)
  end
end
#call the methods
try_load_students()
interactive_menu()
