def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  index = 0
  while index < students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
