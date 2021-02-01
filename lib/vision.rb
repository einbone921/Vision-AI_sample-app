require 'base64'
require 'json'
require 'net/https'

module Vision
  class << self
    def get_image_data(image_file)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_API_KEY']}"

      base64_image = Base64.encode64(open("#{Rails.root}/public/uploads/#{image_file.id}").read)

      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'LABEL_DETECTION'
            }
          ]
        }]
      }.to_json

      url = URI.parse(api_url)
      https = Net::HTTP.new(url.host, url.post)
      https.use_ssl = true
      request = Nent::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)

      JSON.params(response.body)['responses'][0]['labelAnnotations'].pluck('description').take(3)
    end
  end
end