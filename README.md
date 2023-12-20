# Income Expenditure Tracker
The Income Expenditure Tracker serves as a platform for generating detailed income and expenditure statements. Moreover, the application dynamically computes users' disposable income and assigns an I&E rating based on their financial data.


### Prerequisites
Ensure that you have the following installed on your machine:

- Ruby 3.1.2
- Rails 7.1.2
- PostgreSQL


### Setup
#### Clone the repository
- git clone https://github.com/your-username/test-ophelos.git

#### Navigate to the project directory
- cd test-ophelos

#### Install dependencies
- bundle install

#### Set up the database
- rails db:create db:migrate

#### Start the Rails server
- rails server

#### Sign up
- Devise gem instantly help you sign up or login

#### Homepage
- This page will show you all your statement details with disposable income also ratings


### app/views
- income_expenditures/edit.html.erb: View file for editing Income and Expenditure statements.
- income_expenditures/index.html.erb: Displays a table of all Income and Expenditure statements.
- income_expenditures/new.html.erb: View file for creating a new Income and Expenditure statement.
- Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates)

### app/controllers
- income_expenditures_controller.rb: Handles HTTP requests for managing Income and Expenditure statements.

### app/models
- expenditure.rb: Model for Expenditure data, including validations and associations.
- income_expenditure.rb: Model for Income and Expenditure data, including validations, associations, and custom methods.
- income.rb: Model for Income data, including validations and associations.
- config/routes.rb: Defines the application routes, including RESTful routes for managing Income and Expenditure statements.

### db/schema.rb
- Auto-generated schema file representing the database structure having details about the models and table contents

### Spec
- Controller: spec/controllers/income_expenditures_controller_spec.rb
- Models: 
  - spec/models/expenditure_spec.rb
  - spec/models/income_expenditure_spec.rb
  - spec/models/income_spec.rb
- Factories:
  - spec/factories/expenditures.rb
  - spec/factories/income_expenditures.rb
  - spec/factories/income_expenditures.rb
  - spec/factories/users.rb

### Gemfile
Lists all the gems used in the project, including Rails, Bootstrap, Devise, and testing-related gems.
Gems Added

- Bootstrap: Enhances the application's UI with a responsive design and pre-styled components.
- Devise: Provides user authentication and management functionality.
- Autoprefixer-Rails: Ensures cross-browser compatibility for CSS styles.
- Font Awesome Sass: Adds scalable vector icons for a visually appealing UI.
- Simple Form: Simplifies form creation with a concise syntax.
- Factory Bot Rails: A testing library for creating consistent and reusable test data.

## Improvements and Future Work
- **Enhanced User Interface:**
  - Explore opportunities to improve the styling and user interface for a more polished and intuitive look. Consider user feedback and design principles to       enhance the overall user experience.

- **Advanced Analytics:**
  - Incorporate advanced analytics to provide users with more profound insights into their financial data. Utilize charts, graphs, and visualizations to           present data trends and patterns, empowering users to make informed financial decisions.

- **Notification System:**
  - Implement a notification system to remind users to submit their I&E statements monthly. Automated reminders can enhance user engagement and ensure timely     updates.

- **Bank Statement Parsing:**
  - Introduce a feature to parse details directly from bank statements. Enable users to upload or link their bank statements, and automate the extraction of      income and expenditure details. This feature streamlines the process, reducing manual data entry and enhancing accuracy.

- **Enhanced Security Measures:**
  - Strengthen application security by implementing best practices such as parameterized queries, secure authentication mechanisms, and regular security         audits. Consider using tools like Brakeman to scan for security vulnerabilities and address any identified issues promptly.

- **Error Handling and User Feedback:**
  - Enhance the error handling component to provide informative and user-friendly error messages. Ensure that users receive clear feedback in case of form       submission errors or unexpected issues. Implement logging mechanisms to capture and investigate errors on the server side, improving the application's         reliability.

- **Refactoring and DRY Principles:**
  - Conduct code refactoring to improve readability and maintainability. Adhere to DRY principles by eliminating code duplication, utilizing helper methods,     and organizing shared components.


## Scaling for the Future
As the Income Expenditure Tracker grows, scalability becomes a crucial consideration. Here are strategies for scaling the application:

- **Database Optimization:** Regularly review and optimize database queries to ensure efficient performance, especially as the dataset expands.
- **Caching:** Implement caching mechanisms to reduce load times and enhance the app's responsiveness.
- **Load Balancing:** Introduce load balancing to distribute incoming web traffic across multiple servers, ensuring optimal performance and preventing server overload.
- **Microservices Architecture:** Consider transitioning to a microservices architecture, allowing different components of the application to be developed, deployed, and scaled independently.
- **Scaling Database Infrastructure:** As the user base grows, consider scaling the database infrastructure, possibly using sharding or dedicated database clusters.
- **CDN Integration:** Implement a Content Delivery Network (CDN) to distribute static assets globally, reducing latency and improving page load times.
- **Horizontal Scaling:** Scale horizontally by adding more application servers to handle increased traffic and user load.
- **Monitoring and Analytics:** Implement robust monitoring tools to track application performance, identify bottlenecks, and make data-driven decisions for scaling.
