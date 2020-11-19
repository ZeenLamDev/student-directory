@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    filter_by_letter
  when "4"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Filter students by letter"
  puts "4. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

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

# 1. Input_students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
    @students << {name: name, cohort: cohort.to_sym, nationality: nationality}
    if @students.count == 1
      puts "Now we have 1 student"
      puts "Please enter the names of the students"               
    else
      puts "Now we have #{@students.count} students"
      puts "Please enter the names of the students"
      end
      break
    end
  @students
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:nationality]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def filter_cohort()
  puts "Which cohort would you like to filter?"
  cohort = gets.chomp.capitalize
  while !cohort.empty? do
    @students.each { |student| 
    if student[:cohort][0].include? cohort
      puts "#{@student[:name]} (#{@student[:cohort]} cohort) (#{@student[:nationality]})"
    else
      nil
    end
  }
  break
  end
end

def filter_by_letter()
  puts "Which letter would you like to filter students by?"
  letter = gets.chomp.upcase
  while !letter.empty? do
    @students.each { |student| 
    if student[:name][0].include? letter
      puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"
    else
      nil
    end
  }
  break
  end
end

def less_than_12()
  puts "Students with less than 12 characters"
  @students.each do 
    |student| if student[:name].size < 12 then puts "#{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list()
  @students.each_with_index {|student, idx| 
    puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_footer()
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu()


