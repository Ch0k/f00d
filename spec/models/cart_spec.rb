require 'rails_helper'

RSpec.describe Cart, type: :model do
  it {  should have_many(:line_items).dependent(:destroy)   }
end
