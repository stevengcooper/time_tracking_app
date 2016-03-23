require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Developer email is unique" do
    j = Developer.new(first_name: "Jerry", last_name: "Collins", email: "billy@gmail.com", password: BCrypt::Password.create("monkey"))
    assert "billy@gmail.com", developers(:one).email
    refute m.save
  end

  test "Developer must have email, password, and name" do
    developer1 = Developer.new()
    refute developer1.save
  end

  # test "Developer has many time entries" do
  # end



end
