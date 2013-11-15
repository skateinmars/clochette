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
end
