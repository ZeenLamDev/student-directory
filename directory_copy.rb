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

def print_by_letter(students)
  students.each { |student| 
    if student[:name][0] == 't' || student[:name][0] == 'T'
      puts student[:name]
    else
      nil
    end
  }
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {|student, idx| 
    puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
print_by_letter(students)