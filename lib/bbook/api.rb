module Bbook 
    class Api 
		def initialize( api_key, partner_id)
        	@api_key= api_key;#'a';#api_key
			@partner_id = partner_id;#partner_id
			@http_verb = 'GET'
			@url = 'http://api2.bbook.com'
       	end

		def city(city_id) 
			url_path = '/city/' + city_id
			visit(
					:url => @url + url_path, 
					:headers => build_header( url_path )
				)
		end

		def build_date
			return Time.now.httpdate;#.gsub(/GMT/, '+0000')
		end

		def build_header( url_path )
			date_ts = build_date
			message_string = @http_verb + url_path.gsub(/^\//,'') + date_ts.gsub(/\s/,'') 
			hmac = HMAC::MD5.new( @api_key)
			hmac.update( message_string)
		
			return {'Accept' => 'text/xml',
					'Connection' => 'keep-alive',
					'Date' => date_ts,
					'Authorization' => 'BBAPI ' + @partner_id.to_s + ' ' + hmac.hexdigest,
					}
		end
    end
end

