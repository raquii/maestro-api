
puts "creating teacher"
u1=User.create!(
    email: "teacher@example.com",
    password: 'Password1',
    role: 0)
u1.create_teacher_profile(
        first_name: Faker::Name.first_name,
        last_name:Faker::Name.last_name, 
        phone: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.street_address,
        email: "teacher@example.com",
    )

    puts "#{u1.teacher_profile.first_name} #{u1.teacher_profile.last_name} created"
    puts "#{u1.studio.name} created"

puts "creating families"
#creating families
f1=Family.create(studio:u1.studio)
f2=Family.create(studio:u1.studio)
f3=Family.create(studio:u1.studio)
f4=Family.create(studio:u1.studio)
f5=Family.create(studio:u1.studio)
f6=Family.create(studio:u1.studio)


# #creating students
puts "creating students"
s1=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f1,
    studio:Studio.first,
    grade: "10",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s1.first_name} #{s1.last_name} - student created"

s2=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f2,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s2.first_name} #{s2.last_name} - student created"

s3=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f3,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s3.first_name} #{s3.last_name} - student created"
s4=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f4,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s4.first_name} #{s4.last_name} - student created"
s5=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f5,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s5.first_name} #{s5.last_name} - student created"

s6=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f6,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s6.first_name} #{s6.last_name} - student created"
s7=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s1.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f1,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s7.first_name} #{s7.last_name} - student created"
s8=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s2.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f2,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s8.first_name} #{s8.last_name} - student created"
s9=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s3.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f3,
    studio:Studio.first,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{s9.first_name} #{s9.last_name} - student created"

# # creating parents
puts "creating parents"
p1=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s1.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f1,
    studio:Studio.first )
p2=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s2.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f2,
    studio:Studio.first )
p3=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s3.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f3,
    studio:Studio.first )
p4=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s4.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f4,
    studio:Studio.first )
p5=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s5.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f5,
    studio:Studio.first )
p6=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s6.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f6,
    studio:Studio.first )
p7=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s1.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f1,
    studio:Studio.first )
p8=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s2.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f2,
    studio:Studio.first )
p9=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s3.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f3,
    studio:Studio.first )
p10=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:s5.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f5,
    studio:Studio.first )
p11=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: f6,
    studio:Studio.first )

    

    
puts "creating teacher"
u2=User.create!(
    email: "teacher1@example.com",
    password: 'Password1',
    role: 0)
u2.create_teacher_profile(
        first_name: Faker::Name.first_name,
        last_name:Faker::Name.last_name, 
        phone: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.street_address,
        email: "teacher1@example.com",
    )

    puts "#{u2.teacher_profile.first_name} #{u2.teacher_profile.last_name} created"
    puts "#{u2.studio.name} created"

puts "creating families"
#creating families
fa=Family.create(studio:u2.studio)
fb=Family.create(studio:u2.studio)
fc=Family.create(studio:u2.studio)
fd=Family.create(studio:u2.studio)
fe=Family.create(studio:u2.studio)
ff=Family.create(studio:u2.studio)


# #creating students
puts "creating students"
sa=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fa,
    studio:Studio.last,
    grade: "10",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sa.first_name} #{sa.last_name} - student created"

sb=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fb,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sb.first_name} #{sb.last_name} - student created"

sc=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fc,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sc.first_name} #{sc.last_name} - student created"
sd=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fd,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sd.first_name} #{sd.last_name} - student created"
se=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fe,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{se.first_name} #{se.last_name} - student created"
sf=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: ff,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sf.first_name} #{sf.last_name} - student created"
sg=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sa.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fa,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sg.first_name} #{sg.last_name} - student created"
sh=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sb.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fb,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{sh.first_name} #{sh.last_name} - student created"
si=StudentProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sc.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fc,
    studio:Studio.last,
    grade: "11",
    adult: false,
    make_up_credits: 1,
    status: 0,
    default_lesson_duration: 30,
    default_lesson_price: 30,
    gender: 'female',
    birthday: '2005/01/01',
)
puts "#{si.first_name} #{si.last_name} - student created"

# # creating parents
puts "creating parents"
g1=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sa.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fa,
    studio:Studio.last )
g2=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sb.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fb,
    studio:Studio.last )
g3=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sc.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fc,
    studio:Studio.last )
g4=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sd.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fd,
    studio:Studio.last )
g5=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:se.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fe,
    studio:Studio.last )
g6=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sf.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: ff,
    studio:Studio.last )
g7=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sa.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fa,
    studio:Studio.last )
g8=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sb.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fb,
    studio:Studio.last )
g9=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:sc.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fc,
    studio:Studio.last )
g10=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:se.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: fe,
    studio:Studio.last )
g11=GuardianProfile.create(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    family: ff,
    studio:Studio.last )

    


