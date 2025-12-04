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
          'User-Agent' => 'Jekyll-SpeakerDeck-Plugin'
        }

        begin
          response = HTTParty.get(url, headers: headers, timeout: 15)
          
          if response.success?
            doc = Nokogiri::HTML(response.body)
            
            deck_cards = doc.css('.deck-preview')
            break if deck_cards.empty?
            
            deck_cards.each do |card|
              link = card.at_css('a.deck-preview-link')
              next unless link
              
              title_el = card.at_css('.deck-preview-title')
              date_el = card.at_css('.deck-preview-meta time')
              img_el = card.at_css('img')
              
              presentations << {
                'title' => title_el ? title_el.text.strip : 'Untitled',
                'url' => "https://speakerdeck.com#{link['href']}",
                'date' => date_el ? date_el['datetime'] : nil,
                'image_url' => img_el ? img_el['src'] : nil,
                'embed_id' => link['href'].split('/').last
              }
            end
            
            # Check if there's a next page
            next_link = doc.at_css('a[rel="next"]')
            break unless next_link
            
            page += 1
          else
            puts "Error fetching Speaker Deck page #{page}: #{response.code}"
            break
          end
        rescue StandardError => e
          puts "Error fetching Speaker Deck: #{e.message}"
          break
        end
      end
      
      presentations
    end
  end
end
