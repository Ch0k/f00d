require 'rails_helper'

RSpec.describe Product, type: :model do
  it {  should validate_presence_of :title  }
  it {  should validate_presence_of :body  }
  it {  should have_many(:line_items).dependent(:destroy)   }
end
