require 'httparty'
require 'nokogiri'
require 'json'

module FetchGooglePhotos
  class GooglePhotosGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      album_url = site.config['google_photos_album_url']
      return if album_url.nil? || album_url.empty?

      puts "Fetching Google Photos from shared album..."
      photos = fetch_photos_from_album(album_url)
      
      if photos && !photos.empty?
        site.data['google_photos'] = photos
        puts "Loaded #{photos.size} photos from Google Photos"
      else
        site.data['google_photos'] = []
        puts "No photos found from Google Photos album"
      end
    end

    def fetch_photos_from_album(album_url)
      photos = []
      
      headers = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language' => 'en-US,en;q=0.5'
      }

      begin
        # Follow the short URL to get the actual album page
        response = HTTParty.get(album_url, headers: headers, timeout: 30, follow_redirects: true)
        
        if response.success?
          body = response.body
          
          # Google Photos embeds image data in JavaScript
          # Look for image URLs in the page source
          # Pattern: https://lh3.googleusercontent.com/...
          
          image_urls = body.scan(/https:\/\/lh3\.googleusercontent\.com\/[^"'\s\]\\]+/).uniq
          
          # Filter and clean URLs
          image_urls.each_with_index do |url, index|
            # Skip very small images (icons, etc.)
            next if url.include?('=s32') || url.include?('=s64') || url.include?('=s128')
            
            # Clean the URL and set a reasonable size
            clean_url = url.gsub(/=w\d+-h\d+.*$/, '=w800')
            clean_url = clean_url.gsub(/=s\d+.*$/, '=w800')
            
            # Add size parameter if not present
            unless clean_url.include?('=w') || clean_url.include?('=s')
              clean_url = "#{clean_url}=w800"
            end
            
            photos << {
              'url' => clean_url,
              'thumbnail' => clean_url.gsub('=w800', '=w400'),
              'full' => clean_url.gsub('=w800', '=w1600'),
              'index' => index
            }
          end
          
          # Limit to first 50 photos to avoid too many
          photos = photos.first(50)
        else
          puts "Error fetching Google Photos: HTTP #{response.code}"
        end
      rescue StandardError => e
        puts "Error fetching Google Photos: #{e.message}"
      end
      
      photos
    end
  end
end
