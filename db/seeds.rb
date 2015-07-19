if Rails.env.development?
  User.destroy_all
  User.create!(name: 'barry', password: 'password', password_confirmation: 'password')

  Nationality.destroy_all
  Nationality.create!(name: 'American')
  Nationality.create!(name: 'German')
end