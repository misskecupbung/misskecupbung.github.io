require 'httparty'
require 'json'

module FetchGitHubRepos
  class GitHubReposGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      github_users = site.data.dig('repositories', 'github_users')
      return if github_users.nil? || github_users.empty?

      all_repos = []
      
      github_users.each do |username|
        puts "Fetching GitHub repos for #{username}..."
        repos = fetch_repos(username)
        all_repos.concat(repos) if repos
      end
      
      # Sort by pushed_at (most recent first) and take top repos
      all_repos.sort_by! { |r| r['pushed_at'] || '' }.reverse!
      
      if all_repos.any?
        site.data['repositories']['github_repos'] = all_repos.map { |r| "#{r['owner']['login']}/#{r['name']}" }
        site.data['github_repos_data'] = all_repos
        puts "Loaded #{all_repos.size} GitHub repositories"
      end
    end

    def fetch_repos(username)
      repos = []
      page = 1
      
      loop do
        url = "https://api.github.com/users/#{username}/repos?per_page=100&page=#{page}&sort=pushed&direction=desc"
        
        headers = {
          'Accept' => 'application/vnd.github.v3+json',
          'User-Agent' => 'Jekyll-GitHub-Repos-Plugin'
        }
        
        # Use GitHub token if available
        if ENV['GITHUB_TOKEN']
          headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
        end

        begin
          response = HTTParty.get(url, headers: headers, timeout: 30)
          
          if response.success?
            page_repos = JSON.parse(response.body)
            break if page_repos.empty?
            
            # Filter out forks if desired, keep public repos
            page_repos.each do |repo|
              next if repo['private']
              repos << repo
            end
            
            page += 1
            break if page > 5 # Max 5 pages (500 repos)
          else
            puts "Error fetching GitHub repos: HTTP #{response.code}"
            break
          end
        rescue StandardError => e
          puts "Error fetching GitHub repos: #{e.message}"
          break
        end
      end
      
      repos
    end
  end
end
