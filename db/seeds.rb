# Generate some rows for Department model
Department.destroy_all
10.times do |n|
  field = Faker::Job.field
  Department.create!(
    department_name: field
  )
end

# Generate some rows for Role model
Role.destroy_all
10.times do |n|
  position = Faker::Job.position
  Role.create!(
    role_name: position
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
