require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
   def setup
    @admin_user = AdminUser.new(email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
test "password should be present (nonblank)" do
    @admin_user.password = @admin_user.password_confirmation = " " * 6
    assert_not @admin_user.valid?
  end

  test "password should have a minimum length" do
    @admin_user.password = @admin_user.password_confirmation = "a" * 5
    assert_not @admin_user.valid?
  end

end
