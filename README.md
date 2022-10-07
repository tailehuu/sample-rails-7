# Learning rails 7.0.4

## Model

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

