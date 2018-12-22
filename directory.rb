$students = []

def input_students
  puts "Please enter the name of the student"
  name = gets.chomp
  puts "Please enter cohort"
  cohort = gets.chomp
  puts "Please enter country of origin"
  country_origin = gets.chomp
  puts "Please enter height (eg '175' for 175cm)"
  height = gets.chomp
  puts "Please enter your favourite sport"
  sport = gets.chomp

  puts "1.)......TO ADD STUDENT 'add' then ENTER".rjust(30)
  puts "2.)......TO FINISH 'q' then double tap ENTER".rjust(30)
  finish = gets.chomp

  while !name.empty? do
    $students << {name: name, cohort: cohort.to_sym, country_origin: country_origin, height: height.to_i, sport: sport}
      if $students.length < 2
        puts "Now we have #{$students.length} student"
        break
      elsif $students.length >= 2
        puts "Now we have #{$students.length} students"
        name = gets.chomp
      end
  end
    if finish == "add"
      input_students
    else finish == "q"
    $students
    end
  end
def print_header
  puts "The students of my cohort at Makers Academy".center(25)
  puts "--------------------------------".center(50)
end
def print(students)
  index = 0
  while index < $students.length
    puts "#{index + 1}. #{$students[index][:name]} (#{$students[index][:cohort]} cohort)"
    index += 1
  end
end
def print_footer(names)
  if $students.length == 1
    puts "Overall, we have #{$students.length} great student"
  elsif $students.length > 1
    puts "Overall, we have #{$students.length} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
