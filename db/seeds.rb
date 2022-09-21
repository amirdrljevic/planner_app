# Generate some rows for Role model
unless Role.any? 
  Role.create!(
    role_name: "ADMIN"
  )
  Role.create!(
    role_name: "CEO"
  )
  Role.create!(
    role_name: "EMPLOYEE"
  )
  Role.create!(
    role_name: "SECRETARY"
  )
end

# Generate some rows for Department model
Department.destroy_all
10.times do |n|
  field = Faker::Job.field
  Department.create!(
    department_name: field
  )
end

# Generate some rows for Company model
Company.destroy_all
10.times do |n|
  name = Faker::Company.name
  addr = Faker::Address.street_address
  code = Faker::Address.zip_code.to_i
  city = Faker::Address.city
  ctry = Faker::Address.country
  Company.create!(
    company_name:   name,
    street_address: addr,
    postal_code:    code,
    city:           city,
    country:        ctry
  )
end


#create admin user
first_name = "Adin"
last_name  = "Omic"
department_id = 1
role_id = 1
company_id = 1
position = "Admnistrator"
email = "dumbledore@great.com"
date_of_birth =  "1899-09-19"
password =             "avada kedavra"
password_confirmation = "avada kedavra"
activated = true
activated_at = Time.zone.now

User.create!(
  first_name:   first_name,
  last_name: last_name,
  department_id:    department_id,
  role_id:           role_id,
  company_id:        company_id,
  position:   position,
  email: email,
  date_of_birth:    date_of_birth,
  password:           password,
  password_confirmation:        password_confirmation
)
