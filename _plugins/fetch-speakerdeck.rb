require 'httparty'
require 'nokogiri'

module FetchSpeakerDeck
  class SpeakerDeckGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      speakerdeck_username = site.config['speakerdeck_username']
      return if speakerdeck_username.nil? || speakerdeck_username.empty?

      puts "Fetching Speaker Deck presentations for #{speakerdeck_username}..."
      presentations = fetch_presentations(speakerdeck_username)
      
      if presentations && !presentations.empty?
        site.data['speakerdeck_presentations'] = presentations
        puts "Loaded #{presentations.size} Speaker Deck presentations"
      else
        site.data['speakerdeck_presentations'] = []
        puts "No Speaker Deck presentations found"
      end
    end

    def fetch_presentations(username)
      presentations = []
      url = "https://speakerdeck.com/#{username}"
      
      headers = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
      }

      begin
        response = HTTParty.get(url, headers: headers, timeout: 30, follow_redirects: true)
        
        if response.success?
          doc = Nokogiri::HTML(response.body)
          seen_urls = Set.new
          
          # Find all deck links - they follow pattern /username/deck-slug
          doc.css('a[href^="/' + username + '/"]').each do |link|
            href = link['href']
            
            # Skip non-deck links
            next if href.nil?
            next if href.include?('/followers')
            next if href.include?('/following')
            next if href.include?('/stars')
            next if href == "/#{username}"
            next if href == "/#{username}/"
            
            # Build full URL
            full_url = "https://speakerdeck.com#{href}"
            
            # Skip duplicates
            next if seen_urls.include?(full_url)
            seen_urls.add(full_url)
            
            # Get title from the link or nearby elements
            title = nil
            
            # Try to find title in parent card structure
            parent = link.parent
            5.times do
              break if parent.nil?
              title_el = parent.at_css('.deck-preview-title, h3, h4, .title, [class*="title"]')
              if title_el
                title = title_el.text.strip
                break
              end
              parent = parent.parent
            end
            
            # Fallback to link text if no title found
            title = link.text.strip if title.nil? || title.empty?
            
            # Skip if still no meaningful title
            next if title.nil? || title.empty? || title == username
            
            # Get embed ID from URL
            embed_id = href.split('/').last
            
            presentations << {
              'title' => title,
              'url' => full_url,
              'embed_id' => embed_id
            }
          end
        else
          puts "Error fetching Speaker Deck: HTTP #{response.code}"
        end
      rescue StandardError => e
        puts "Error fetching Speaker Deck: #{e.message}"
      end
      
      # Remove duplicates by URL and return
      presentations.uniq { |p| p['url'] }
    end
  end
end
