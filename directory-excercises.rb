=begin
@students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]
=end
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
# Under twelve letters.
#under_12_letters = Proc.new { |word| word.length < 12}
# begins with a specific Character
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 1
  students.each do |student|
    if student[:name] =~ /^[Ss]/
    puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)"
    count += 1
    end
  end
end

def print_footer(names)
  if @students.count == 1
    puts "Overall, we have #{names.count} evil student."
  else
    puts "Overall, we have #{names.count} evil students."
  end
end
#call the methods
input_students()
print_header()
print(@students)
print_footer(@students)
