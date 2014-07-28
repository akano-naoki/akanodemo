require 'rails_helper'

RSpec.describe "chats/new", :type => :view do
  before(:each) do
    assign(:chat, Chat.new(
      :name => "MyString",
      :comment => "MyString"
    ))
  end

  it "renders new chat form" do
    render

    assert_select "form[action=?][method=?]", chats_path, "post" do

      assert_select "input#chat_name[name=?]", "chat[name]"

      assert_select "input#chat_comment[name=?]", "chat[comment]"
    end
  end
end
