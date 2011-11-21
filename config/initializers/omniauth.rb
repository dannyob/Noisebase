GITHUB_ID      = "8cc223e4fc1470c80cac"
GITHUB_SECRET  = "ea6853810e5097aa7aff7d8f15286f4debd74168" 

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, GITHUB_ID, GITHUB_SECRET
end
