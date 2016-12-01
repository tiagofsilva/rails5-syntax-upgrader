require 'simplecov'
SimpleCov.start

require 'pry'

Dir[
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Rails.root.join('spec/support/**/*.rb'),
  # Requires shared examples in spec/shared/ and its subdirectories.
  Rails.root.join('spec/shared/**/*.rb')
].each { |f| require f }


RSpec.configure do |config|

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

end

