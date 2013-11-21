module Helpers
  def github_payload
    File.open(
      File.join(File.dirname(__FILE__),
                '..',
                'fixtures',
                'sample_github_payload.json')
    ).read
  end

  def github_webhook_params
    {'payload' => github_payload}
  end

  def login_user(user = nil, password = 'password')
    user ||= FactoryGirl.create(:user)

    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: password
    find(:css, "input[type='submit']").click
  end
end
