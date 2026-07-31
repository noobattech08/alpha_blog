module UsersHelper

  # The below gravatar method has been taken from gravatar website under ruby for implementation.
  def gravatar_for(user)
    email_address = user.email.downcase
    hash = Digest::SHA256.hexdigest(email_address)
    params = URI.encode_www_form("d" => 80, "s" => 200)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?#{params}"
    image_tag(gravatar_url, alt: user.username)
  end
end
