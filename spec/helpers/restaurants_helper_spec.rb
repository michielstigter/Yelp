require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RestaurantsHelper. For example:
#
# describe RestaurantsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe ReviewsHelper, :type => :helper do
  describe '#star_rating' do
    it 'does nothing if rating is not a number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    xit 'returns 3 black stars and 2 white stars for 3' do
      expect(helper.star_rating(3)).to eq ''
    end
  end
end
