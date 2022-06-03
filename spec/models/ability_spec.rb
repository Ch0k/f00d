require 'rails_helper'

describe Ability do
  subject(:ability) { Ability.new(user) }

  describe 'for guest' do
    let(:user) { nil }
    it { should be_able_to :read, Product }
    it { should_not be_able_to :manage, Product }
    it { should_not be_able_to :manage, User }
    it { should_not be_able_to :read, User }
    it { should_not be_able_to :manage, Order }
    it { should_not be_able_to :read, Order }
  end

  describe 'for admin' do
    let(:user) { create(:admin) }
    it { should be_able_to :manage, :all }
  end

  describe 'for manager' do
    let(:user) { create(:manager) }
    it { should be_able_to :manage, :all }
    it { should_not be_able_to :manage, User }
  end

  describe 'for customer' do
    let(:user) { create(:customer) }
    it { should be_able_to :read, Product }
    it { should_not be_able_to :manage, Product }
    it { should_not be_able_to :manage, User }
    it { should_not be_able_to :read, User }
    it { should_not be_able_to :manage, Order }
    it { should be_able_to :create, Order }
  end
end
