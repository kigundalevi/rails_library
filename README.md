# Library Management System: Streamline Book Borrowing and Returns

The Library Management System is a Ruby on Rails application designed to efficiently manage book borrowing and returns in a library setting. This system provides a user-friendly interface for both library patrons and administrators, streamlining the process of book management and lending.

Built with Ruby on Rails, this application leverages modern web technologies to offer a responsive and intuitive user experience. It incorporates features such as user authentication, book cataloging, borrowing management, and administrative controls. The system is designed to be scalable and easily deployable, making it suitable for libraries of various sizes.

Key features include:
- User authentication and profile management
- Comprehensive book catalog with search functionality
- Borrowing and return process management
- Administrative interface for book and user management
- Real-time updates using Action Cable
- Progressive Web App (PWA) capabilities for offline access
- Responsive design for seamless use across devices

## Repository Structure

```
.
├── app/                    # Application code
│   ├── controllers/        # Request handling logic
│   ├── models/             # Data and business logic
│   ├── views/              # Templates for rendering HTML
│   ├── javascript/         # JavaScript files
│   └── assets/             # Static assets (CSS, images)
├── config/                 # Application configuration
├── db/                     # Database migrations and schema
├── spec/                   # RSpec test files
├── test/                   # Test files
├── Dockerfile              # Docker configuration for production
├── Gemfile                 # Ruby dependencies
└── config.ru               # Rack configuration
```

Key Files:
- `config/routes.rb`: Defines the application's URL routes
- `config/database.yml`: Database configuration
- `config/deploy.yml`: Deployment configuration
- `app/controllers/application_controller.rb`: Base controller
- `app/models/book.rb`: Book model
- `app/models/borrowing.rb`: Borrowing model
- `app/models/user.rb`: User model

## Usage Instructions

### Installation

Prerequisites:
- Ruby 3.4.1
- SQLite3
- Node.js and Yarn

Steps:
1. Clone the repository:
   ```
   git clone <repository-url>
   cd library-management-system
   ```
2. Install dependencies:
   ```
   bundle install
   yarn install
   ```
3. Set up the database:
   ```
   rails db:create db:migrate db:seed
   ```
4. Start the server:
   ```
   rails server
   ```

### Configuration

1. Set environment variables in `.env` file:
   ```
   RAILS_MASTER_KEY=<your-master-key>
   ```
2. Configure database in `config/database.yml`
3. Set up Action Cable in `config/cable.yml`

### Common Use Cases

1. Adding a new book:
   ```ruby
   Book.create(title: "1984", author: "George Orwell", isbn: "9780451524935")
   ```

2. Borrowing a book:
   ```ruby
   user = User.find(1)
   book = Book.find(1)
   Borrowing.create(user: user, book: book, borrowed_date: Date.today, due_date: 2.weeks.from_now)
   ```

3. Returning a book:
   ```ruby
   borrowing = Borrowing.find(1)
   borrowing.update(returned_date: Date.today)
   ```

### Testing & Quality

Run the test suite:
```
rspec
```

### Troubleshooting

1. Issue: Database connection errors
   - Check `config/database.yml` for correct configuration
   - Ensure SQLite3 is installed: `sqlite3 --version`
   - Verify database exists: `rails db:version`

2. Issue: Asset compilation fails
   - Clear asset cache: `rails assets:clobber`
   - Precompile assets: `rails assets:precompile`
   - Check Webpacker configuration in `config/webpacker.yml`

Debugging:
- Enable debug logging in `config/environments/development.rb`:
  ```ruby
  config.log_level = :debug
  ```
- Check `log/development.log` for detailed error messages

Performance optimization:
- Monitor database query performance using the Rails console:
  ```ruby
  ActiveRecord::Base.connection.execute("EXPLAIN ANALYZE SELECT * FROM books")
  ```
- Use the `rack-mini-profiler` gem for identifying bottlenecks

## Data Flow

The Library Management System follows a typical MVC (Model-View-Controller) architecture for handling data flow. Here's an overview of how data flows through the application:

1. User Request: The user interacts with the application through the browser.
2. Routing: The request is routed to the appropriate controller action based on the URL.
3. Controller: The controller processes the request, interacts with models, and prepares data for the view.
4. Model: Models interact with the database and encapsulate business logic.
5. View: The view renders the HTML response using data provided by the controller.
6. Response: The rendered view is sent back to the user's browser.

```
[Browser] <-> [Routes] <-> [Controller] <-> [Model] <-> [Database]
                              ^
                              |
                              v
                           [View]
```

Note: For real-time updates, Action Cable is used to push data from the server to the client, bypassing the traditional request-response cycle.

## Deployment

Prerequisites:
- Docker
- Kamal

Steps:
1. Build the Docker image:
   ```
   docker build -t library_app .
   ```
2. Configure deployment settings in `config/deploy.yml`
3. Deploy using Kamal:
   ```
   bin/kamal deploy
   ```

## Infrastructure

The application uses the following infrastructure resources:

- Web Server:
  - Type: Docker container
  - Image: `your-user/library_app`
  - Host: 192.168.0.1
  - Port: 80 (internal), 443 (external, SSL)

- Database:
  - Type: SQLite3
  - Storage: Docker volume (`library_app_storage:/rails/storage`)

- SSL:
  - Provider: Let's Encrypt
  - Domain: app.example.com

- Job Processing:
  - Type: Solid Queue (in-process)
  - Concurrency: Configurable via `JOB_CONCURRENCY` environment variable