# Modelize MongoDB Documents
Automatically turn MongoDB BSON Documents into custom models.

Works with the Ruby MongoDB driver, [or Minimongo](https://github.com/fugroup/minimongo) if you want something even easier.

### Installation
```ruby
gem install modelize
```
or add to Gemfile. That's it!

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

# Create your model
class Model
  # You model content here ...
end

# With the Mongodb Ruby driver
models = $db[:models].find.to_a
model = $db[:models].find.first

# With Minimongo
models = find(:models).to_a
model = first(:models)

# The models will be of type "Model" if you've defined such as class
```

### Contribute
Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
