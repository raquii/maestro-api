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

    Studio.create(name:"#{u1.last_name} #{Faker::Music.instrument} Studio", teacher_id: u1.id)

u2=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: 'Password1!',
    role: 0)

    Studio.create(name:"#{u2.last_name} #{Faker::Music.instrument} Studio", teacher_id: u2.id)

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
    family: f1)
    StudentProfile.create(
    grade: 10,
    adult: false,
    make_up_credits: 1,
    status: 0,
    user_id: s1.id,
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
    family: f2)
    StudentProfile.create(
        grade: 11,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s2.id,
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
    family: f3)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s3.id,
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
    family: f4)   
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s4.id,
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
    family: f5)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s5.id,
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
    family: f6)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s6.id,
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
    family: f7)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s7.id,
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
    family: f8)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s8.id,
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
    family: f9)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s9.id,
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
    family: f10)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s10.id,
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
    family: f11)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s11.id,
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
    family: f11)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s12.id,
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
    family: f1)
    StudentProfile.create(
        grade: 10,
        adult: false,
        make_up_credits: 1,
        status: 0,
        user_id: s13.id,
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
    family: f1 )
p2=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f1)
p3=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f11)
p4=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:2,
    family: f11)   
p5=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role:2,
    family: f2)
p6=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f8)
p7=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f9)
p8=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f9)
p9=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f4)
p10=User.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10),
    role: 2,
    family: f5)