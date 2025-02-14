# Admin Login Instructions

To login as an admin in this application:

1. Navigate to the standard login page at `/users/sign_in`
2. Enter your admin user's email and password in the login form
3. Click "Sign in"

Notes:
- Admin status is determined by the `admin` boolean field in the users table
- Admin users use the same login form as regular users
- The system will automatically detect admin privileges after login through the `admin?` method
- Admin status is set to `false` by default for new users
- Admin status can only be changed directly in the database or through the Rails console

To create an admin user via the Rails console:
```ruby
# Access the Rails console
rails console

# Create or update a user as admin
user = User.find_or_create_by(email: 'admin@example.com') do |u|
  u.password = 'your_secure_password'
  u.password_confirmation = 'your_secure_password'
end
user.update(admin: true)
```