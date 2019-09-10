# see directory_add_exercises.txt for alternative requirements compared to directory.rb
def input_students
  puts "Please enter the student information"
  students = []
  while true do
    print "Name: "
    name = gets.delete!("\n")
    break if name.empty?
    print "Hobby: "
    hobby = gets.delete!("\n")
    print "DOB (dd/mm/yy): "
    dob = gets.delete!("\n")
    students << {name: name, cohort: :november, hobby: hobby, dob: dob}
    puts "Now we have #{students.count} student" if students.count == 1
    puts "Now we have #{students.count} students" if students.count > 1
    puts "Next student! To finish, just hit return twice"
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_selective(names)
  n = 0
  while n < names.count
    if names[n][:name][0] == "J" && names[n][:name].size < 12
      puts "#{n + 1}. #{names[n][:name]} (#{names[n][:cohort]} cohort)".center(100)
      puts "They were born on #{names[n][:dob]} and their hobby is #{names[n][:hobby]}!".center(100)
    end
    n += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
if !students.empty?
  print_header
  print_selective(students)
  print_footer(students)
end
