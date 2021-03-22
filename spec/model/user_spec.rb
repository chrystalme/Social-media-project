require 'rails_helper'

RSpec.describe User, type: 'model' do
    context 'association' do
      it { should have_many (:posts) }
  end
end