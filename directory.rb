@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def interactive_menu
  loop do
   print_menu
    process(STDIN.gets.chomp)
  end
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
def enter_name
  puts "Please enter the name of the student"
  name = STDIN.gets.chomp
    if name == ""
    name = "name: not entered"
    end
end
def enter_name_default
  puts "Please enter cohort"
  cohort = STDIN.gets.chomp
    if cohort == ""
    cohort = "not entered: "
    end
end
def student_count_message
  if @students.length < 2
    puts "Now we have #{@students.count} student"
  elsif @students.length >= 2
    puts "Now we have #{@students.count} students"
end
def input_students
  enter_name
  enter_name_default
  name = enter_name
  while !name.empty? do
    add_student(name, :november)
    student_count_message
      end
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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
  puts "Enter the 'save as' filename"
  filename = gets.chomp
  file = File.open("#{filename}.csv", "w")
  @students.each do |student|
    students_data = [student[:name], student[:cohort]]
    csv_line = students_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "List saved to file"
end

def load_students
  puts "Enter the filename you want to load (without the file extension)"
  filename = gets.chomp
  file = File.open("#{filename}.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
  puts "List loaded from file"
end

def try_load_students
  filename = ARGV.first
  return load_students if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_student(name, cohort)
  @students << {:name => name, :cohort => cohort.to_sym}
end

try_load_students
interactive_menu
