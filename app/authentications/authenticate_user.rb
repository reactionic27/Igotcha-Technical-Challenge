class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JWTService.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by!(email: @email)
    return user if user&.authentiate(@password)

    errors.add(:user_authentication, "Invalid Credentials")
    return nil
  end
end