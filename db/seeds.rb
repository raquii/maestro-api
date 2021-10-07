# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: 'Password1!',
    role: 0)


u2=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: 'Password1!',
    role: 0)


#creating families
f1=Family.create(studio:Studio.first)
f2=Family.create(studio:Studio.first)
f3=Family.create(studio:Studio.first)
f4=Family.create(studio:Studio.first)
f5=Family.create(studio:Studio.first)
f6=Family.create(studio:Studio.first)
f7=Family.create(studio:Studio.last)
f8=Family.create(studio:Studio.last)
f9=Family.create(studio:Studio.last)
f10=Family.create(studio:Studio.last)
f11=Family.create(studio:Studio.last)

#creating students

s1=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f1,
    studio:Studio.first)
    s1.create_student_profile(
    grade: 10,
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',)
s2=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f2,
    studio:Studio.first)
    s2.create_student_profile(
        grade: 11,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s3=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f3,
    studio:Studio.first)
    s3.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 3,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s4=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:1,
    family: f4,
    studio:Studio.first)   
    s4.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 4,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s5=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:1,
    family: f5,
    studio:Studio.first)
    s5.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s6=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f6,
    studio:Studio.first)
    s6.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 1,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s7=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f7,
    studio:Studio.last)
    s7.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s8=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f8,
    studio:Studio.last)
    s8.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s9=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f9,
    studio:Studio.last)
    s9.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s10=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 1,
    family: f10,
    studio:Studio.last)
    s10.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s11=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:1,
    family: f11,
    studio:Studio.last)
    s11.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s12=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:1,
    family: f11,
    studio:Studio.last)
    s12.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)
s13=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:1,
    family: f1,
    studio:Studio.first)
    s13.create_student_profile(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        default_lesson_duration: 30,
        default_lesson_price: 30,
        gender: 'female',
        birthday: '2005/01/01',)

# creating parents

p1=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f1,
    studio:Studio.first )
p2=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f1,
    studio:Studio.first)
p3=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f11,
    studio:Studio.last)
p4=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:2,
    family: f11,
    studio:Studio.last)   
p5=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:2,
    family: f2,
    studio:Studio.first)
p6=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f8,
    studio:Studio.last)
p7=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f9,
    studio:Studio.last)
p8=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f9,
    studio:Studio.last)
p9=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f4,
    studio:Studio.first)
p10=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f5,
    studio:Studio.first)