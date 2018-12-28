@students = []
def input_students
  puts "Please enter the name of the student"
  name = gets.chop
    if name == ""
    name = "name: not entered"
    end
  puts "Please enter cohort"
  cohort = gets.chop
    if cohort == ""
    cohort = "not entered: "
    end
  puts "Please enter country of origin"
  country_origin = gets.chop
  puts "Please enter height (eg '175' for 175cm)"
  height = gets.chop
  puts "Please enter your favourite sport"
  sport = gets.chop
  while !name.empty? do
    @students << {name: name.to_sym, cohort: cohort.to_sym, country_origin: country_origin, height: height, sport: sport}
      if @students.length < 2
        puts "Now we have #{@students.count} student"
          break
      elsif @students.length >= 2
        puts "Now we have #{@students.count} students"
          name = gets.chop
      end
  end
end
def interactive_menu
  loop do
   print_menu
    process(gets.chomp)
  end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from student.csv"
  puts "9. Exit"
end
def show_students
  print_header
  print_student_list
  print_footer
end
def process(selection)
    case selection
     when "1"
       input_students
     when "2"
       show_students
     when "3"
       save_students
     when "4"
       load_students
     when "9"
       exit
     else
       puts "I don't know what you meant, try again"
   end
end

def print_header
  puts "The students of my cohort at Makers Academy".center(20)
  puts "--------------------------------".center(45)
end
def print_student_list
  index = 0
    while index < @students.length
      if @students.length >= 1
      puts "#{index + 1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
        index += 1
      end
   end
end
def print_footer #8.9 pluralisation for student/s
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.length > 1
    puts "Overall, we have #{@students.count} great students"
  end
end
def save_students
  file = File.open(".student.csv", "w")
  @students.each do |student|
    students_data = [student[:name], student[:cohort]]
    csv_line = students_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students
  file = File.open(".student.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students  << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
interactive_menu

# def option_menu(students) # Added a menu for better usability
#   puts "  "
#   puts "1.)......To make any CHANGES, ENTER 'c'"
#   puts "2.)......To SEARCH students by cohort ENTER 's'"
#   puts "3.)......To FINISH press ENTER"
#   choice = gets.chop.downcase
#     if choice == "c"
#       puts "Enter the student number you want to change"
#         student_num = gets.chop.to_i
#       puts "Enter the correct name"
#         new_name = gets.chop.to_sym
#       puts "Enter the correct cohort"
#         new_cohort = gets.chop.to_sym
#         index = (student_num - 1)
#         $students[index][:name] = new_name
#         $students[index][:cohort] = new_cohort
#       end
#     if choice == "s"
#         print_student_by_cohort(students)
#     else
#         print(students)
#     end
# end
# @student = input_students
# show_students
# print_header
# print_student_list
# print_footer(student)
# # option_menu(students)
