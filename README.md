# Modelize MongoDB Documents
Automatically turn MongoDB BSON Documents into custom models.

Works with [the official Ruby MongoDB driver](https://docs.mongodb.com/ruby-driver/master/quick-start/), [or Minimongo](https://github.com/fugroup/minimongo) if you want something even easier.

### Installation
```ruby
gem install modelize
```
or add to your Gemfile. That's it!

### Settings
```ruby
# Tell Modelize in which module to find your model class
Modelize.module = ''

# If you model class is in the Fu::Models module
Modelize.module = 'Fu::Models'

# Debug option
Modelize.debug = false
```

### Usage
If your MongoDB collection is named "models", then your model class should be named "Model", and it'll automatically be picked up.

The gem works by adding some spice to the Mongo::Collection::View "to_a" and "first" methods.

```ruby
# If you don't have bundler set up
require 'modelize'

# Create your model, no includes necessary
class Model
  # Your model definitions here ...
end

# Without Modelize, just pure Ruby driver
models = find(:models).to_a     # => [BSON::Document, BSON::Document]
model = first(:models)          # => BSON::Document

# With Modelize and Minimongo
models = find(:models).to_a     # => [Model, Model]
model = first(:models)          # => Model

# With Modelize and the Mongodb Ruby driver
models = $db[:models].find.to_a # => [Model, Model]
model = $db[:models].find.first # => Model
```
The models will be of type "Model" if you've defined such as class. You can then do:
```ruby
model = first(:models)

# The original BSON::Document
model.doc # => BSON::Document instance

# The model class accepts any method that BSON::Document accepts
model.to_h # => {'_id' => BSON::ObjectId('586c4ac80aec08424e3a5287')}

# You can read and write variables
model.description = 'we need truth'
model.light = 'yes'
model.description # => 'we need truth'
model.light # => 'yes'

# And then save them (Minimongo)
model.earth = 'undiscovered'
update(:models, {:_id => m._id}, m.to_h)

# Refetch it and it's saved
model = first(:models, :_id => m._id)
m.earth # => 'undiscovered'

# Returns nil if not found, doesn't raise an error
model.darkness # => nil
```
You can now add validations or whatever you want to your model, it's just a normal Ruby class. Enjoy!

### Contribute
Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
