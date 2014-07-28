require 'rails_helper'

RSpec.describe "chats/index", :type => :view do
  before(:each) do
    assign(:chats, [
      Chat.create!(
        :name => "Name",
        :comment => "Comment"
      ),
      Chat.create!(
        :name => "Name",
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of chats" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
