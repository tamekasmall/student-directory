$students = []

def input_students
  puts "Please enter the name of the students"
  name = gets.chomp
  puts "Please enter country of origin"
  country_origin = gets.chomp
  puts "Please enter height (eg for 175cm)"
  height = gets.chomp
  puts "Please enter your favourite sport"
  sport = gets.chomp
  puts "To finish, enter'q'or to add another student enter 'add'then double tap ENTER"
  finish = gets.chomp

  while !name.empty? do
    $students << {name: name, cohort: :november, country_origin: country_origin, height: height.to_i, sport: sport}
    puts "Now we have #{$students.length} students"
    name = gets.chomp
  end
  if finish == "add"
    input_students
  else finish == "q"
    $students
  end
end
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
def print(students)
  index = 0
  while index < $students.length
    puts "#{index + 1}. #{$students[index][:name]} (#{$students[index][:cohort]} cohort)"
    index += 1
  end
end
def print_footer(names)
  puts "Overall, we have #($students.length} great students"
end

students = input_students
print_header
print(students)$students = []

def input_students
  puts "Please enter the name of the students"
  name = gets.chomp
  puts "Please enter country of origin"
  country_origin = gets.chomp
  puts "Please enter height (eg for 175cm)"
  height = gets.chomp
  puts "Please enter your favourite sport"
  sport = gets.chomp
  puts "To finish, enter'q'or to add another student enter 'add'then double tap ENTER"
  finish = gets.chomp

  while !name.empty? do
    $students << {name: name, cohort: :november, country_origin: country_origin, height: height.to_i, sport: sport}
    puts "Now we have #{$students.length} students"
    name = gets.chomp
  end
  if finish == "add"
    input_students
  else finish == "q"
    $students
  end
end
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
def print(students)
  index = 0
  while index < $students.length
    puts "#{index + 1}. #{$students[index][:name]} (#{$students[index][:cohort]} cohort)"
    index += 1
  end
end
def print_footer(names)
  puts "Overall, we have #($students.length} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
print_footer(students)
