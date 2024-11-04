# Création de quelques utilisateurs
User.create!(
  email: "user1@yopmail.com",
  encrypted_password: "password1",
  description: "Premier utilisateur test",
  first_name: "John",
  last_name: "Doe"
)

User.create!(
  email: "user2@yopmail.com",
  encrypted_password: "password2",
  description: "Deuxième utilisateur test",
  first_name: "Jane",
  last_name: "Doe"
)

# Création d'un événement
Event.create!(
  start_date: Time.now + 1.day,
  duration: 60,
  title: "Soirée Networking",
  description: "Rencontre professionnelle et réseautage",
  price: 10,
  location: "Strasbourg",
  user_id: User.first.id
)
