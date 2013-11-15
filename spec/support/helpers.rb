module Helpers
  def github_payload
    JSON.parse(
      File.open(
        File.join(File.dirname(__FILE__),
                  '..',
                  'fixtures',
                  'sample_github_payload.json')
      ).read
    )
  end
end
