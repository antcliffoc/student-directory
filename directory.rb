@students = []

def input_students
  puts 'Please enter the names of the students to add'
  puts "to finish, just hit return twice"
  name = STDIN.gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #takes first argument given in command line
  return if filename.nil? #leave function if no filename given (i.e no arguments)
  if File.exists?(filename)
    load_students()
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "sorry, #{filename} doesn't exist."
    exit
  end
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
