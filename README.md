# Option#1: Running the Program Directly. Create a file called main.rb (or any name you prefer) to use your calculator:

#### **`main.rb`**
``` ruby
require_relative 'string_calculator'
```

### Example usage
``` ruby
puts StringCalculator.add("")         # => 0
puts StringCalculator.add("1")        # => 1
puts StringCalculator.add("1,5")      # => 6
puts StringCalculator.add("1\n2,3")   # => 6
puts StringCalculator.add("10\n20,30\n40,50") # => 150
```

Run it with:
``` ruby
ruby main.rb
```

# Option#2: Running the Tests
Prerequisites:
First, install RSpec if you haven't already:
``` ruby
gem install rspec
```

Running the tests:
``` ruby
rspec string_calculator_spec.rb
```

You should see output like:
``` ruby
......

Finished in 0.002 seconds (files took 0.1 seconds to load)
6 examples, 0 failures
```

# Option#3: Interactive Console (IRB)
You can also test the calculator interactively:
``` ruby
irb
```

Then in IRB:
``` ruby
require_relative 'string_calculator'
StringCalculator.add("1,2,3")       # => 6
StringCalculator.add("1\n2\n3")     # => 6
StringCalculator.add("1\n2,3\n4")  # => 10
```
