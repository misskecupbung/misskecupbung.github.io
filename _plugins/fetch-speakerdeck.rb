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
        puts "No Speaker Deck presentations found or error fetching"
      end
    end

    def fetch_presentations(username)
      presentations = []
      page = 1
      
      loop do
        url = "https://speakerdeck.com/#{username}?page=#{page}"
        
        headers = {
          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
          'Accept' => 'text/html,application/xhtml+xml'
        }

        begin
          response = HTTParty.get(url, headers: headers, timeout: 30, follow_redirects: true)
          
          if response.success?
            doc = Nokogiri::HTML(response.body)
            
            # Try multiple selectors for deck cards
            deck_cards = doc.css('.deck-preview, .talk, article.deck, [data-testid="deck-card"]')
            
            # If no cards found, try finding links to presentations
            if deck_cards.empty?
              doc.css('a[href*="/misskecupbung/"]').each do |link|
                href = link['href']
                next if href.nil? || href.include?('/followers') || href.include?('/following') || href.include?('/stars')
                next unless href.start_with?("/#{username}/")
                
                title = link.text.strip
                title = 'Untitled' if title.empty?
                
                # Skip navigation links
                next if ['Following', 'Followers', 'Stars', username].include?(title)
                
                full_url = "https://speakerdeck.com#{href}"
                embed_id = href.split('/').last
                
                # Avoid duplicates
                next if presentations.any? { |p| p['url'] == full_url }
                
                presentations << {
                  'title' => title,
                  'url' => full_url,
                  'date' => nil,
                  'image_url' => nil,
                  'embed_id' => embed_id
                }
              end
              break
            end
            
            deck_cards.each do |card|
              link = card.at_css('a[href*="/#{username}/"]') || card.at_css('a.deck-preview-link') || card.at_css('a')
              next unless link && link['href']
              
              href = link['href']
              next if href.include?('/followers') || href.include?('/following')
              
              title_el = card.at_css('.deck-preview-title, h3, h4, .title')
              date_el = card.at_css('time, .date, .deck-preview-meta time')
              img_el = card.at_css('img')
              
              title = title_el ? title_el.text.strip : link.text.strip
              title = 'Untitled' if title.empty?
              
              full_url = href.start_with?('http') ? href : "https://speakerdeck.com#{href}"
              
              presentations << {
                'title' => title,
                'url' => full_url,
                'date' => date_el ? (date_el['datetime'] || date_el.text.strip) : nil,
                'image_url' => img_el ? img_el['src'] : nil,
                'embed_id' => href.split('/').last
              }
            end
            
            # Check if there's a next page
            next_link = doc.at_css('a[rel="next"], .pagination a.next')
            break unless next_link
            
            page += 1
          else
            puts "Error fetching Speaker Deck page #{page}: HTTP #{response.code}"
            break
          end
        rescue StandardError => e
          puts "Error fetching Speaker Deck: #{e.message}"
          break
        end
      end
      
      presentations.uniq { |p| p['url'] }
    end
  end
end
