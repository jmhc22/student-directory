def input_students
  puts "Please enter student information"
  students = []
  cohort = " "
  months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
  while true do
    print "Name: "
    name = gets.chomp
    break if name.empty?
    until months.any? { |m| m == cohort }
      print "Cohort (please enter valid month): "
      cohort = gets.chomp
      cohort = "September" if cohort.empty?
    end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Next student! To finish, just hit return twice"
    cohort = " "
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_by_cohort(names)
  student_hash = Hash.new([])
  names.each do |n|
    student_hash[n[:cohort]] = student_hash[n[:cohort]] + [n[:name]]
  end
  student_hash.each do |month, students|
  puts month.upcase + ":"
  puts students
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
