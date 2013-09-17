FactoryGirl.define do
  factory :employee_user, :class => 'User' do
    sequence(:username) { |n| "emp#{n}" }
    password            { |u1| "#{u1.username}123" }
    email               { |u1| "#{u1.username}@fedena.com" }
    first_name          'John'
    last_name           'Doe'
    role                'Employee'
  end

  factory :admin_user, :class => 'User' do
    sequence(:username) { |n| "admin#{n}" }
    password            { |u1| "#{u1.username}123" }
    email               { |u1| "#{u1.username}@fedena.com" }
    first_name          'John'
    last_name           'Doe'
    role 'Admin'
  end

  factory :reminder do
    recipient { FactoryGirl.create(:employee_user).id }
    body      'Reminding'
  end

  factory :student do
    sequence(:admission_no) { |n| "#{n}" }
    admission_date  Date.today - 10.days
    date_of_birth   Date.today - 5.years
    first_name      'John'
    middle_name     'K'
    last_name       'Doe'
    address_line1   ''
    address_line2   ''
    batch_id        1
    gender          'm'
    country_id      76
    nationality_id  76
  end

  factory :guardian do
    first_name 'Fname'
    last_name  'Lname'
    relation   'Parent'
  end

  factory :course do
    course_name  '1'
    section_name 'A'
    code         '1A'

    batches { |batches| [batches.association(:batch)] }
  end

  factory :batch do
    name       '2010/11'
    start_date { Date.today }
    end_date   { Date.today + 1.years }
  end

  factory :batch_group do
    name       'batch'
  end

  factory :exam_group do
    sequence(:name) { |n| "Exam Group #{n}" }
    exam_date       { Date.today }
    exam_type       'grades'
    sequence(:cce_exam_category_id) { |n| n }
  end

  factory :grading_level do
    name      'A'
    min_score 85
    order     1
    batch     { Factory.create(:batch) }
  end

  factory :subject do
    name               'Subject'
    code               'SUB'
    max_weekly_classes 8
    batch
  end

  factory :subject_leave do
    student   { FactoryGirl.create(:student) }
    batch     { FactoryGirl.create(:batch) }
    subject   { FactoryGirl.create(:general_subject) }
    month_date              Date.current
    sequence(:reason) { |n| "sample_reason#{n}" }
  end

  factory :exam do
    start_time    { Time.now }
    end_time      { Time.now + 1.hours }
    maximum_marks 100
    minimum_marks 30
    weightage     50
  end

  factory :general_subject, :class => 'Subject' do
    name               'Subject'
    sequence(:code) { |n| "SUB#{n}" }
    batch_id           1
    max_weekly_classes 5
    credit_hours       10
  end

  factory :elective_group do
    name     'Test Elective'
    batch_id 1
  end

  factory :employee_department do
    sequence(:name) { |n| "emp_department#{n}" }
    sequence(:code) { |n| "forad#{n}" }
  end

  factory :employee do
    employee_category_id    5
    sequence(:employee_number)   { |n| "#{n}" }
    first_name              "John"
    employee_position_id    7
    employee_department_id  8
    date_of_birth           { Date.today - 18.years }
    joining_date            { Date.today - 3.days }
    nationality_id          9
  end

  factory :employee_grade do
    sequence(:name)   { |n| "Em Grade #{n}" }
    sequence(:priority)   { |n| "#{n}" }
    status              true
  end

  factory :general_department, :class => 'EmployeeDepartment' do
    name 'Dep1'
    code 'forad'
  end

  factory :employee_category do
    sequence(:name)   { |n| "emp_category#{n}" }
    sequence(:prefix) { |n| "forad#{n}" }
  end

  factory :general_emp_category, :class => 'EmployeeCategory' do
    name   'cat1'
    prefix 'forads'
  end

  factory :weekday do
    weekday     '1'
    day_of_week '1'
    is_deleted  false
    batch_id    nil
  end

  factory :ranking_level do
    sequence(:name)   { |n| "rank#{n}" }
    marks             90
  end

  factory :fee_collection_discount do
  end

  factory :student_category do
    name 'Category A'
    is_deleted false
  end

  factory :timetable do
    start_date { Time.now - 5.days }
    end_date   { Time.now + 5.days }
  end

  factory :timetable_entry do
    timetable
    subject
  end

  factory :employees_subject do
    employee
    subject
  end
  
  factory :attendance do
    sequence(:reason)   { |n| "reason#{n}" }
    month_date          { Date.today }
    batch
    student             { Factory.create(:student, :batch => batch) }
  end
  
  factory :event do
    sequence(:title)       { |n| "event_title #{n}" }
    sequence(:description) { |n| "event_description #{n}" }
    start_date             { Date.today.to_datetime }
    end_date               { (Date.today + 2.days).to_datetime }
  end

  factory :user_event do; end

  factory :finance_fee do; end

  factory :finance_fee_collection do
    sequence(:name)  { |n| "FFC#{n}" }
    start_date       { Date.today }
    end_date         { Date.today + 1.days }
    due_date         { Date.today + 2.days }
    fee_category_id  1
    is_deleted       false
  end
end
