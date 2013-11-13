module Helpers
  def github_payload
    {
      'commits' => [
        {
          'author' => {
            'email' => 'toto@example.org',
          },
          'message' => 'Fix #20',
          'url' => 'example.org'
        },
        {
          'author' => {
            'email' => 'bob@example.com',
          },
          'message' => 'Fix #21',
          'url' => 'example.com'
        },
        {
          'author' => {
            'email' => 'bib@example.com',
          },
          'message' => 'Cleanup',
          'url' => 'example.com'
        }
      ],
      'repository' => {
        'name' => 'clochette',
      }
    }
  end
end
