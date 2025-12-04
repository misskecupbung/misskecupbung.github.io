require 'httparty'
require 'json'

module FetchCredlyBadges
  class CredlyGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      credly_username = site.config['credly_username']
      return if credly_username.nil? || credly_username.empty?

      puts "Fetching Credly badges for #{credly_username}..."
      badges = fetch_badges(credly_username)
      
      if badges && !badges.empty?
        site.data['credly_badges'] = badges
        puts "Loaded #{badges.size} Credly badges"
      else
        site.data['credly_badges'] = []
        puts "No Credly badges found or error fetching"
      end
    end

    def fetch_badges(username)
      # Credly public API endpoint
      url = "https://www.credly.com/users/#{username}/badges.json"
      
      headers = {
        'Accept' => 'application/json',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
      }

      begin
        response = HTTParty.get(url, headers: headers, timeout: 30, follow_redirects: true)
        
        if response.success?
          data = JSON.parse(response.body)
          badges = data['data'] || []
          
          badges.map do |badge|
            {
              'id' => badge['id'],
              'name' => badge.dig('badge_template', 'name') || 'Unknown',
              'description' => badge.dig('badge_template', 'description') || '',
              'image_url' => badge.dig('badge_template', 'image_url') || '',
              'badge_url' => "https://www.credly.com/badges/#{badge['id']}/public_url",
              'issuer' => badge.dig('badge_template', 'issuer', 'name') || 'Unknown',
              'issued_at' => badge['issued_at'],
              'expires_at' => badge['expires_at']
            }
          end
        else
          puts "Error fetching Credly badges: HTTP #{response.code}"
          []
        end
      rescue StandardError => e
        puts "Error fetching Credly badges: #{e.message}"
        []
      end
    end
  end
end
