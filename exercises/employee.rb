class Employee
  attr_reader :salary, :name

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def set_boss(boss)
    boss.add_employee(self)
    @boss = boss
  end

  def lower_salaries
    @salary
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee


  def initialize(name, title, salary, boss, employees=[])
    @employees = employees
    super(name, title, salary, boss)
  end

  def add_employee(employee)
    @employees << employee
  end

  def lower_salaries
    salaries = 0
    @employees.each do |employee|
      salaries += employee.lower_salaries
    end
    salaries + salary
  end

  def bonus(multiplier)
    sum = 0
    @employees.each do |el|
      sum += el.lower_salaries
    end
    sum * multiplier
  end

end

if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("Shawna", "TA", 12000, nil)
  david = Employee.new("David", "TA", 10000, nil)
  darren = Manager.new("Darren", "TA Manager", 78000, nil)
  ned = Manager.new("Ned", "Founder", 1000000, nil)
  shawna.set_boss(darren)
  david.set_boss(darren)
  darren.set_boss(ned)

  puts "Ned: #{ned.bonus(5)}"
  puts "Darren: #{darren.bonus(4)}"
  puts "David: #{david.bonus(3)}"
end
