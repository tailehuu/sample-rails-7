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
    - Sample
    
      ```ruby
      class Person < ApplicationRecord
        validates :name, presence: true
      end
      ```
    
    - Validation will be triggered when call `save`, `save!`, `create`, `create!`, `update`, `update!`
    - Will NOT be triggered on `insert`, `update_all`, `update_attribute`, `update_column`, `save(validation: false)` ...
    - Validation helpers
      - `:on` option
        - `validates :name, presense: true, on: :create`
        - `validates :name, presense: true, on: :update`
      - `acceptance`
      - `validates_associated`: trigger validation on associated model as well
      - `confirmation`
        - `case_sensitive` option `validates :email, confirmation: { case_sensitive: false }`
      - `comparison`: 
        - `validates :start_date, comparison: { greater_than: :end_date }`
        - `validates :start_date, comparison: { greater_than_or_equal_to: :end_date }`
        - `validates :start_date, comparison: { less_than: :end_date }`
        - `validates :start_date, comparison: { less_than_or_equal_to: :end_date }`
        - `validates :amount, comparison: { other_than: 12 }`
      - `exclusion`
      - `inclusion`
      - `format`
      - `length`
      - `numericality`
      - `presense`
      - `inverse_of`
      - `absence`
      - `uniqueness`
      - `validates_with`
      - `validates_each`
      - common options: `allow_nil`, `allow_blank`, `message` ...
      - errors
        - `.errors.full_messages`
        - `.errors.where(:attribute)`
        
        ```ruby
          article = Article.new.valid?
          error = article.errors.where(:attribute).last
          puts error.attribute
          puts error.name
          puts error.message
          puts error.full_message
        ```

- Active Record Callbacks
  - Create an object
    - before_validation
    - after_validation
    - before_save
    - around_save
    - before_create
    - around_create
    - after_create
    - after_save
    - after_commit / after_rollback
  - Update an object
    - before_validation
    - after_validation
    - before_save
    - around_save
    - before_update
    - around_update
    - after_update
    - after_save
    - after_commit / after_rollback
  - Destroy an object
    - before_destroy
    - around_destroy
    - after_destroy
    - after_commit / after_rollback
  - `after_initialize` 
  - `after_find` 
  - `after_touch`
  - `after_commit` alias
    - `after_create_commit`
    - `after_update_commit`
    - `after_destroy_commit`
    - `after_save_commit` = `after_create_commit` + `after_update_commit`
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

