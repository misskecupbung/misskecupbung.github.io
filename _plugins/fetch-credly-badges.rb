require 'httparty'
require 'nokogiri'
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
      url = "https://www.credly.com/users/#{username}/badges.json"
      
      headers = {
        'Accept' => 'application/json',
        'User-Agent' => 'Jekyll-Credly-Plugin'
      }

      begin
        response = HTTParty.get(url, headers: headers, timeout: 15)
        
        if response.success?
          data = JSON.parse(response.body)
          badges = data['data'] || []
          
          badges.map do |badge|
            {
              'name' => badge['badge_template']['name'],
              'description' => badge['badge_template']['description'],
              'image_url' => badge['badge_template']['image_url'],
              'badge_url' => "https://www.credly.com#{badge['path']}",
              'issuer' => badge['badge_template']['issuer']['name'],
              'issued_at' => badge['issued_at'],
              'expires_at' => badge['expires_at']
            }
          end
        else
          puts "Error fetching Credly badges: #{response.code}"
          []
        end
      rescue StandardError => e
        puts "Error fetching Credly badges: #{e.message}"
        []
      end
    end
  end
end
