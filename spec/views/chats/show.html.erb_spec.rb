require 'rails_helper'

RSpec.describe "chats/show", :type => :view do
  before(:each) do
    @chat = assign(:chat, Chat.create!(
      :name => "Name",
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Comment/)
  end
end
