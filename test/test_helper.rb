---
provider: github
uid: 987494
credentials:
  token: 107b100f7dc4e2f71e09424d88d985478f75453e
user_info:
  nickname: zv
  email: zephyr.pellerin@gmail.com
  name: Zephyr Pellerin
  urls:
    GitHub: http://github.com/zv
    Blog: zv.github.com
extra:
  user_hash:
    owned_private_repos: 0
    disk_usage: 228
    type: User
    plan:
      private_repos: 0
      space: 307200
      name: free
      collaborators: 0
    public_gists: 0
    location: San Francisco
    company: !!null 
    private_gists: 0
    email: zephyr.pellerin@gmail.com
    following: 4
    gravatar_id: 874bcba40024d48919097b29a25e852d
    blog: zv.github.com
    hireable: false
    avatar_url: https://secure.gravatar.com/avatar/874bcba40024d48919097b29a25e852d?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png
    public_repos: 7
    followers: 3
    bio: !!null 
    url: https://api.github.com/users/zv
    created_at: '2011-08-18T00:47:24Z'
    name: Zephyr Pellerin
    total_private_repos: 0
    collaborators: 0
    html_url: https://github.com/zv
    id: 987494
    login: zv





ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
