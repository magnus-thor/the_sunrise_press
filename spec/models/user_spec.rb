require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
    it { is_expected.to have_db_column :name }
  end

  describe 'roles' do 
    it { is_expected.to respond_to :member! }
    it { is_expected.to respond_to :member? }
    it { is_expected.to respond_to :journalist! }
    it { is_expected.to respond_to :journalist? }
    it { is_expected.to respond_to :editor! }
    it { is_expected.to respond_to :editor? }
  end

  describe 'FactoryBot' do
    it 'for member is valid' do
      expect(create(:member)).to be_valid
    end
    it 'for journalist is valid' do
      expect(create(:journalist)).to be_valid
    end
    it 'for editor is valid' do
      expect(create(:editor)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:articles) }
  end
end