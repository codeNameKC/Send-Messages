require 'test_helper'

class SendEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_email = send_emails(:one)
  end

  test "should get index" do
    get send_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_send_email_url
    assert_response :success
  end

  test "should create send_email" do
    assert_difference('SendEmail.count') do
      post send_emails_url, params: { send_email: { Email: @send_email.Email, Message: @send_email.Message } }
    end

    assert_redirected_to send_email_url(SendEmail.last)
  end

  test "should show send_email" do
    get send_email_url(@send_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_email_url(@send_email)
    assert_response :success
  end

  test "should update send_email" do
    patch send_email_url(@send_email), params: { send_email: { Email: @send_email.Email, Message: @send_email.Message } }
    assert_redirected_to send_email_url(@send_email)
  end

  test "should destroy send_email" do
    assert_difference('SendEmail.count', -1) do
      delete send_email_url(@send_email)
    end

    assert_redirected_to send_emails_url
  end
end
