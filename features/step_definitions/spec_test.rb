require File.join(File.dirname(__FILE__), "/../../spec/spec_helper")
module Bbook 
    describe Api do
		before(:each) do
			@partner_id = 'partner id'
			@api_key = 'my api key'
		end

        context "starting up" do
            it "should send a welcome message" do
                api = Api.new(@api_key, @partner_id);#messenger)
                api.city "1"
             end
         end
     end
end
