FactoryGirl.define do

	factory :user do
		name			"Sann Storm"
		email			"sannstorm@example.com"
		password 		"foobar"
		password_confirmation	"foobar"
	end
end
