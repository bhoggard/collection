if Rails.env.development?
  User.destroy_all
  User.create!(name: 'barry', password: 'password', password_confirmation: 'password')
end