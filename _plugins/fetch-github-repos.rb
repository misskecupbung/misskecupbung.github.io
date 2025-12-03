require 'httparty'
require 'json'

module FetchGitHubRepos
  class ReposGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      github_users = site.data['repositories']['github_users']
      return if github_users.nil? || github_users.empty?

      all_repos = []

      github_users.each do |username|
        puts "Fetching GitHub repos for #{username}..."
        repos = fetch_user_repos(username)
        all_repos.concat(repos) if repos
      end

      # Sort by pushed_at (most recently updated first)
      all_repos.sort_by! { |r| r['pushed_at'] || '' }.reverse!

      # Format as "owner/repo" for the existing template
      repo_list = all_repos.map { |r| r['full_name'] }

      # Update the site data so templates can use it
      site.data['repositories']['github_repos'] = repo_list

      puts "Loaded #{repo_list.size} repos, sorted by latest activity"
    end

    def fetch_user_repos(username)
      # Fetch up to 100 public repos, sorted by pushed date
      url = "https://api.github.com/users/#{username}/repos?per_page=100&sort=pushed&direction=desc"
      
      headers = {
        'Accept' => 'application/vnd.github.v3+json',
        'User-Agent' => 'Jekyll-GitHub-Repos-Plugin'
      }

      # Use GITHUB_TOKEN if available (for higher rate limits)
      if ENV['GITHUB_TOKEN']
        headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
      end

      begin
        response = HTTParty.get(url, headers: headers, timeout: 10)
        
        if response.success?
          JSON.parse(response.body)
        else
          puts "Error fetching repos for #{username}: #{response.code}"
          []
        end
      rescue StandardError => e
        puts "Error fetching repos for #{username}: #{e.message}"
        []
      end
    end
  end
end
