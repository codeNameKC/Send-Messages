require "application_system_test_case"

class SendEmailsTest < ApplicationSystemTestCase
  setup do
    @send_email = send_emails(:one)
  end

  test "creating a Send email" do
    visit send_emails_url
    click_on "New Send Email"

    fill_in "Email", with: @send_email.Email
    fill_in "Message", with: @send_email.Message
    click_on "Create Send email"

    assert_text "Send email was successfully created"
    click_on "Back"
  end
end
