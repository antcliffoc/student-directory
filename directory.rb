
# let's put all students into an array

def input_students
  puts 'Please enter the names of the students'
  puts "to finish, just hit return twice"
  # creat an empty array
  students = []
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} evil students."
end
#call the methods
students = input_students()
print_header()
print(students)
print_footer(students)
