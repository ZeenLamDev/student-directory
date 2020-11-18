COHORT = [
  "January",
  "Febuary",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp.capitalize

  puts "Enter cohort"
  cohort = gets.chomp.capitalize
  if cohort.empty?
    cohort = :November
  else
    while !COHORT.include?(cohort)
      puts "No such cohort, please try again."
      cohort = gets.chomp.capitalize
    end
  end

  puts "Enter Nationality"
  nationality = gets.chomp.capitalize
  
  while !name.empty? do
    students << {name: name, cohort: cohort.to_sym, nationality: nationality}
    if students.count == 1
      puts "Now we have 1 student"
      puts "Please enter the names of the students"               
    else
      puts "Now we have #{students.count} students"
      puts "Please enter the names of the students"
      end
      break
    end
  students
end

def group_cohort(students)
  students.sort_by{|student| student[:cohort]}
end

def print_by_letter(students)
  puts "Which letter would you like to filter?"
  puts "Just hit return if you do not want to filter"
  letter = gets.chomp.upcase
  while !letter.empty? do
    students.each { |student| 
    if student[:name][0].include? letter
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"
    else
      nil
    end
  }
  break
  end
  
end

def less_than_12(students)
  puts "Students with less than 12 characters"
  students.each do 
    |student| if student[:name].size < 12 then puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {|student, idx| 
    puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
students = group_cohort(students)
print_header()
print(students)
print_by_letter(students)
less_than_12(students)
print_footer(students)

