User.create!(name:  'Example User',
						 email: 'example@example.com')

99.times do |n|
	name  = Faker::Name.name
	email = "example-#{n+1}@example.com"
	User.create!(name: name, email: email)
end

users = User.order(:name)
users.each do |user|
	10.times do
		description = Faker::Hipster.sentence
		date = Faker::Date.between(from: '2015-01-01', to: '2022-01-01')
		user.events.create!(description: description, date: date)
	end
end