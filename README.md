# Learning rails 7.0.4

## Model

- Active Record
  - Inherit from `ApplicationRecord`, not `ActiveRecord::Base`
- Active Record Migrations
  - create_table
    - `rails generate migration CreateProducts name:string description:text`
  - change_table
  - create_join_table
    - `rails generate migration CreateJoinTableCustomerProduct customer product`
  - add_column
    - `rails generate migration AddPartNumberToProducts part_number:string`
    - or
    - `rails generate migration AddPartNumberToProducts part_number`
  - add column & index
    - `rails generate migration AddPartNumberToProducts part_number:string:index`
  - add reference
    - `rails generate migration AddUserRefToProducts user:references`
  - remove_column
    - `rails generate migration RemovePartNumberFromProducts part_number:string`
  - commands
    - `rails db:migrate`
    - `rails db:migrate VERSION=xxxxx`
    - `rails db:migrate:up VERSION=xxxxx`
    - `rails db:migrate:down VERSION=xxxxx`
    - `rails db:migrate:redo`
    - `rails db:migrate:redo STEP=n`
    - `rails db:migrate:status`
    - `rails db:rollback`
    - `rails db:rollback STEP=n`
    - `rails db:setup`
    - `rails db:drop`
    - `rails db:reset`
    - `rails db:schema:load RAILS_ENV=test`
- Active Record Validations
- Active Record Callbacks
- Active Record Associations

### Concern

- `extend ActiveSupport::Concern`
- validation in concern

    ```ruby
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
    ```
  
- `class_method`

    ```ruby
      class_methods do
        def public_count
          where(status: 'public').count
        end
      end
    ```
- 

## View

- Datetime
  - `distance_of_time_in_words(Time.now, Time.now + 15.seconds)`
  - `time_ago_in_words(3.minutes.from_now)`

## Controller

- Basic authentication
  - `http_basic_authenticate_with name: "tai", password: "secret", only: :destroy`

