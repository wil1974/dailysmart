require 'rails_helper'

RSpec.describe Topic, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'validations' do
    it 'cannot be created without a title' do
      @topic.title = nil
      expect(@topic).to_not be_valid
    end

    # it 'cannot be created without a slug' do
    #   @topic.slug = nil
    #   expect(@topic).to_not be_valid
    # end
  end

  describe 'callbacks' do
    #Friendly_id Gem - if no default URL is given for the slug it will auto-generate one,
    it 'automatically sets the slug value even with a nil value submitted' do
      expect(@topic.slug).to_not eq(nil)
    end
  end
end
