Factory.define :registration do |f|
  f.first_name 'John'
  f.last_name 'Doe'
  f.email_address 'jdoe@gmail.com'
  f.login 'jdoe'
  f.password 'password'
  f.password_confirmation 'password'
end
