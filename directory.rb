$students = []
def input_students
  puts "Please enter the name of the student"
  name = gets.chomp
    if name == ""
    name = "name: not entered"
    end
  puts "Please enter cohort"
  cohort = gets.chomp
    if cohort == ""
    cohort = "not entered: "
    end
  puts "Please enter country of origin"
  country_origin = gets.chomp
  puts "Please enter height (eg '175' for 175cm)"
  height = gets.chomp
  puts "Please enter your favourite sport"
  sport = gets.chomp
  puts "1.)......To ADD STUDENT 'add' then ENTER".rjust(30)
  puts "2.)......To FINISH 'q' then double tap ENTER".rjust(30)
  finish = gets.chomp
  while !name.empty? do
    $students << {name: name.to_sym, cohort: cohort.to_sym, country_origin: country_origin, height: height, sport: sport}
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
  puts "The students of my cohort at Makers Academy".center(20)
  puts "--------------------------------".center(45)
end
def print(students)
  index = 0
    while index < $students.length
      puts "#{index + 1}. #{$students[index][:name]} (#{$students[index][:cohort]} cohort)"
        index += 1
    end
end
def print_footer(names) #8.9 pluralisation for student/s
  if $students.length == 1
    puts "Overall, we have #{$students.length} great student"
  elsif $students.length > 1
    puts "Overall, we have #{$students.length} great students"
  end
end
def print_student_by_cohort(students) #8.8 printing students by cohort, iteration over array
  array = []
    puts "Enter cohort to print"
      user_input = gets.chomp.downcase.to_sym
      $students.map {|student| array << student if student[:cohort] == user_input}
      array.each {|student| puts "#{student[:name]} (#{student[:cohort]})"}
    end

def option_menu(students) # Added a menu for better usability
  puts "  "
  puts "1.)......To make any CHANGES, ENTER 'c'"
  puts "2.)......To SEARCH students by cohort ENTER 's'"
  puts "3.)......To FINISH press ENTER"
  choice = gets.chomp.downcase
    if choice == "c"
      puts "Enter the student number you want to change"
        student_num = gets.chomp.to_i
      puts "Enter the correct name"
        new_name = gets.chomp.to_sym
      puts "Enter the correct cohort"
        new_cohort = gets.chomp.to_sym
        index = (student_num - 1)
        $students[index][:name] = new_name
        $students[index][:cohort] = new_cohort
      end
    if choice == "s"
        print_student_by_cohort(students)
    else
        print(students)
    end
end
students = input_students
print_header
print(students)
print_footer(students)
option_menu(students)
